var BoundingBox;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
BoundingBox = (function() {
  function BoundingBox(child, opts) {
    this.child = child;
    if (opts == null) {
      opts = {};
    }
    this.enable = __bind(this.enable, this);
    this.disable = __bind(this.disable, this);
    this.box = $("<div class='bounding-box'>\n  <a href=\"#\" class='close-box' alt='close'>close</a>\n</div>");
    this.box.append(this.child);
    child = this.child;
    this.box.resizable({
      alsoResize: child,
      handles: 'se',
      containment: 'parent'
    });
    this.box.draggable({
      grid: [25, 25],
      containment: 'parent'
    });
    this.bind_events();
    this.disable();
    this.append(opts.container);
  }
  BoundingBox.prototype.bind_events = function() {
    var time;
    time = 200;
    this.box.mouseenter(__bind(function(e) {
      return setTimeout(this.enable, time);
    }, this));
    this.box.mouseleave(__bind(function(e) {
      if (!this.box.hasClass("ui-resizable-resizing")) {
        return setTimeout(this.disable, time);
      }
    }, this));
    return this.box.click(__bind(function(e) {
      e.preventDefault();
      return this.enable();
    }, this));
  };
  BoundingBox.prototype.set_dimensions = function() {
    var child, full_height, full_width, height, padding_bottom, padding_left, padding_right, padding_top, width;
    child = this.child;
    padding_top = parseInt(child.css("padding-top"));
    padding_right = parseInt(child.css("padding-right"));
    padding_bottom = parseInt(child.css("padding-bottom"));
    padding_left = parseInt(child.css("padding-left"));
    width = parseInt(child.css("width"));
    height = parseInt(child.css("height"));
    full_width = width + padding_left + padding_right;
    full_height = height + padding_top + padding_bottom;
    return this.box.css({
      width: full_width,
      height: full_height
    });
  };
  BoundingBox.prototype.disable = function() {
    this.box.resizable("option", "disabled", true);
    return this.box.draggable("option", "disabled", true);
  };
  BoundingBox.prototype.enable = function() {
    this.box.resizable("option", "disabled", false);
    return this.box.draggable("option", "disabled", false);
  };
  BoundingBox.prototype.append = function(target) {
    target.append(this.box);
    return this.set_dimensions();
  };
  return BoundingBox;
})();var Widget;
Widget = (function() {
  function Widget(element, opts) {
    this.element = element;
    if (opts == null) {
      opts = {};
    }
    this.bounding_box = new BoundingBox(this.element, opts);
  }
  Widget.prototype.append = function(target) {
    return this.bounding_box.append(target);
  };
  return Widget;
})();var Menu;
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
Menu = (function() {
  __extends(Menu, Widget);
  Menu.defaults = {
    color: "green"
  };
  function Menu(opts) {
    if (opts == null) {
      opts = Menu.defaults;
    }
    this.element = $("<div class='inset-button-group'>\n  <a href='#' class='active'>One</a>\n  <a href='#'>Two</a>\n  <a href='#'>Three</a>\n  <a href='#'>Four</a>\n</div>");
    this.element.addClass(opts.color || Menu.defaults.color);
    Menu.__super__.constructor.call(this, this.element, opts);
  }
  return Menu;
})();var Button;
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
Button = (function() {
  __extends(Button, Widget);
  Button.defaults = {
    size: "large",
    color: "green",
    striped: false,
    square: false,
    pill: false,
    bordered: false
  };
  function Button(opts) {
    if (opts == null) {
      opts = Button.defaults;
    }
    this.element = $("<a href='#' class='button'>Click me!</a>");
    this.element.addClass(opts.size || Button.defaults.size);
    this.element.addClass(opts.color || Button.defaults.color);
    if (opts.striped) {
      this.element.addClass("striped");
    }
    if (opts.square) {
      this.element.addClass("square");
    }
    if (opts.pill) {
      this.element.addClass("pill");
    }
    if (opts.bordered) {
      this.element.addClass("bordered");
    }
    Button.__super__.constructor.call(this, this.element, opts);
  }
  return Button;
})();var Notification;
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
Notification = (function() {
  __extends(Notification, Widget);
  Notification.defaults = {
    type: "success",
    flat: false,
    light: false
  };
  function Notification(opts) {
    if (opts == null) {
      opts = Notification.defaults;
    }
    this.element = $("<div class=\"notification\">\n  <a href=\"#\" class=\"close-link\">X</a>\n  <h3>Notification</h3>\n  <p>Some message</p>\n</div>");
    this.element.addClass(opts.type || Notification.defaults.type);
    if (opts.flat) {
      this.element.addClass("flat");
    }
    if (opts.light) {
      this.element.addClass("light");
    }
    Notification.__super__.constructor.call(this, this.element, opts);
  }
  return Notification;
})();var GradientBox;
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
GradientBox = (function() {
  __extends(GradientBox, Widget);
  GradientBox.defaults = {
    color: "green",
    striped: false
  };
  function GradientBox(opts) {
    if (opts == null) {
      opts = GradientBox.defaults;
    }
    this.element = $("<div class='gradient-box'>\n  <h3>100</h3>\n  <small>of something</small>\n</div>");
    this.element.addClass(opts.color || GradientBox.defaults.color);
    if (opts.striped) {
      this.element.addClass("striped");
    }
    GradientBox.__super__.constructor.call(this, this.element, opts);
  }
  return GradientBox;
})();