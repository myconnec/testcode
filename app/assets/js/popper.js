//= require jquery
//= require callback

if ("undefined" == typeof com) { var com = {}; }
if (!com.jivatechnology) { com.jivatechnology = {}; }

(function () {

    var CallbackList = com.jivatechnology.CallbackList;

    this.Popper = (function () {

        var merge_options = function (obj1, obj2) {
            obj1 = obj1 || {};
            obj2 = obj2 || {};
            var obj3 = {};
            for (var attr1 in obj1) {
                if (obj1.hasOwnProperty(attr1)) { obj3[attr1] = obj1[attr1]; }
            }
            for (var attr2 in obj2) {
                if (obj2.hasOwnProperty(attr2)) { obj3[attr2] = obj2[attr2]; }
            }
            return obj3;
        };

        var create_getter_setter = function (options, name) {
            return function () {
                if (arguments.length == 1) {
                    // Setter
                    options[name] = arguments[0];
                    return options[name];
                } else {
                    // Getter
                    return options[name];
                }
            };
        };

        // Return the constructor
        return function (opts) {

            var that = this;

            // Options
            var defaults = {
                onOpen: [],
                onClose: [],
                placement: "north",
                baseClass: "popper"
            };

            var options = merge_options(defaults, opts);

            // Manage popper
            var popper;

            var createPopper = function () {
                //  For IE7 compatibility we are using popper && 1 == popper.nodeType instead of popper instanceof HTMLElement
                if (!(popper && 1 == popper.nodeType)) {
                    var baseClass = that.baseClass();
                    var classes = baseClass + " " + baseClass + "-" + that.placement();
                    var arrowClass = baseClass + "-arrow";
                    var containerClass = baseClass + "-container";
                    var markup = "<div class='" + classes + "'><div class='" + arrowClass + "'></div><div class='" + containerClass + "'></div></div>";
                    $target().after(markup);
                    popper = $target()[0].nextSibling;
                }
            };

            var positionPoppers = {
                "north": function () {
                    var position = $target().position();
                    position.top -= popperHeight();
                    position.left -= (popperWidth() - targetWidth()) / 2;
                    return position;
                },
                "south": function () {
                    var position = $target().position();
                    position.top += targetHeight();
                    position.left -= (popperWidth() - targetWidth()) / 2;
                    return position;
                },
                "east": function () {
                    var position = $target().position();
                    position.top += (targetHeight() - popperHeight()) / 2;
                    position.left += targetWidth();
                    return position;
                },
                "west": function () {
                    var position = $target().position();
                    position.top += (targetHeight() - popperHeight()) / 2;
                    position.left -= popperWidth();
                    return position;
                }
            };

            var positionRounded = function (position) {
                position.top = Math.round(position.top);
                position.left = Math.round(position.left);
                return position;
            };

            var positionPopper = function () {
                var positioner = positionPoppers[that.placement().toLowerCase()];
                if (typeof positioner != 'function') {
                    throw "Unrecognised placement " + that.placement();
                }

                // Absolutely position it so we can accurately measure width and height
                $popper().css("position", "absolute").css("left", 0).css("top", 0);

                // Now calculate correct position
                var position = positioner();
                position = positionRounded(position);
                $popper().css("left", position.left).css("top", position.top);
            };

            var destroyPopper = function () {
                $popper().remove();
                popper = null;
            };

            // Helpers
            var $target = function () { return $(that.target()); };
            var $popper = function () { return $(popper); };

            // Element info
            var popperWidth = function () { return $popper().width(); };
            var popperHeight = function () { return $popper().height(); };
            var targetWidth = function () { return $target().width(); };
            var targetHeight = function () { return $target().height(); };

            // State machine
            var state = "closed";

            var state_open = function () {
                if (isClosed()) {
                    state = "open";
                    createPopper();
                    that.onOpen.handle(that);
                    positionPopper();
                }
            };
            var state_close = function () {
                if (isOpen()) {
                    state = "closed";
                    that.onClose.handle(that);
                    destroyPopper();
                }
            };

            var isClosed = function () { return state == "closed"; };
            var isOpen = function () { return state == "open"; };

            // Public methods
            this.target = create_getter_setter(options, "target");
            this.placement = create_getter_setter(options, "placement");
            this.baseClass = create_getter_setter(options, "baseClass");

            this.container = function () {
                return $(popper).find("." + that.baseClass() + "-container")[0];
            };

            this.trigger = function (type) {
                switch (type) {
                    case "hover":
                        $target().hover(that.open, that.close);
                        break;
                    case "click":
                        $target().click(that.open);
                        break;
                    case "none":
                        break;
                    default:
                        throw "unrecognised type " + type;
                }
            };

            this.open = function () { state_open(); };
            this.close = function () { state_close(); };

            // Initialize options
            this.onOpen = new CallbackList(options.onOpen, { must_keep: true });
            this.onClose = new CallbackList(options.onClose, { must_keep: true });
            if (options.trigger) { this.trigger(options.trigger) };
        };

    })();

}).call(com.jivatechnology);