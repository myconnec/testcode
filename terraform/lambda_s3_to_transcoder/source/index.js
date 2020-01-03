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
 var key = event.Records[0].s3.object.key;
 var pipelineId = process.env.transcoder_pipeline_id;
 if (bucket !== process.env.media_source_bucket_id) {
  context.fail('Incorrect Video Input Bucket');
  return;
 }
 var srcKey =  decodeURIComponent(event.Records[0].s3.object.key.replace(/\+/g, " ")); //the object may have spaces
 var newKey = key.split('.')[0];
 var params = {
  PipelineId: pipelineId,
//  OutputKeyPrefix: '',
  Input: {
   Key: srcKey,
   FrameRate: 'auto',
   Resolution: 'auto',
   AspectRatio: 'auto',
   Interlaced: 'auto',
   Container: 'auto'
  },
  Outputs: [{
   Key: newKey + '.mp4',
   // Generic 720p in mp4: 1351620000001-000010
   // Generic 1080p in mp4: 11351620000001-000001
   PresetId: '1351620000001-000001', //
//   ThumbnailPattern: 'thumbs-' + newKey + '-{count}',
//    Watermarks: [{
//     InputKey: 'watermarks/logo-horiz-large.png',
//     PresetWatermarkId: 'BottomRight'
//    }],
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
