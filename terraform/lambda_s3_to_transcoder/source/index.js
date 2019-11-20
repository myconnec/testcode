// source https://read.acloud.guru/easy-video-transcoding-in-aws-7a0abaaab7b8
'use strict';
var AWS = require('aws-sdk');
var s3 = new AWS.S3({
 apiVersion: '2012-09-25'
});
var eltr = new AWS.ElasticTranscoder({
 apiVersion: '2012-09-25',
 region: process.env.region
});
exports.handler = function(event, context) {
 console.log('Executing Elastic Transcoder Orchestrator');
 var bucket = event.Records[0].s3.bucket.name;
 var Outputkey = decodeURIComponent(event.Records[0].s3.object.key).replace(/[^0-9a-zA-Z\-\.\/]/g, '').toLowerCase();
 var pipelineId = process.env.transcoder_pipeline_id;
 if (bucket !== process.env.media_source_bucket_id) {
  context.fail('Incorrect Video Input Bucket');
  return;
 }
 //the object may have spaces
 var sourceKey =  decodeURIComponent(event.Records[0].s3.object.key.replace(/\+/g, " "));
 var params = {
  PipelineId: pipelineId,
  Input: {
   Key: sourceKey,
   FrameRate: 'auto',
   Resolution: 'auto',
   AspectRatio: 'auto',
   Interlaced: 'auto',
   Container: 'auto'
  },
  Outputs: [{
    Key: Outputkey,
    PresetId: '1351620000001-000001',
    ThumbnailPattern: Outputkey + '-{count}'
  }]
 };
 console.log('Starting Job');
 eltr.createJob(params, function(err, data){
  if (err){
   console.log(err);
  } else {
   console.log(data);
  }
  context.succeed('Job well done');
 });
};
