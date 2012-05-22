var editor = {
  columns: {},
  library: {},
  selection: {},
  toolbar: {}
}

// initialize ----------------------------------------------------------------

editor.init = function(){
  this.columns.init()
  this.library.init()
  this.toolbar.init()
}


// columns -------------------------------------------------------------------

editor.columns = {
  init: function(){

    // make columns clickable
    $("#canvas .column").on("click", function(e){
      editor.selection.item($(e.target))
      e.stopPropagation()
      editor.selection.monitor()
    })

    // make columns droppable
    $("#canvas .column").droppable({
      hoverClass: "hovered",
      scope: "column",
      drop: function(e, ui){
        $(this).append(ui.draggable)
      }
    })
  },

  add: function(){
    var $column = editor.selection.item()
    var existing_columns = editor.toolbar.columns.check()
    var new_columns = existing_columns + 1
    var existing_html = (existing_columns == 1 ? $column.html() : false)
    var width = (100 / new_columns).toString() + "%"
    if (existing_columns == 1) {
      $column.html("").append(this.new(width).html(existing_html))
    } else {
      $(editor.selection.item()).find("> .column").css("width", width)
    }
    $column.append(this.new(width))
  },

  new: function(width){
    var $html = $("<div></div>").addClass("column").css("width", width)
      .droppable({
        hoverClass: "hovered",
        scope: "column",
        drop: function(e, ui){
          $(this).append(ui.draggable)
        }
      })    
    return $html    
  }
}


// library -------------------------------------------------------------------

editor.library = {
  init: function(){

    // place library based on stored position
    if ($.cookie("library")) {
      var cookie = JSON.parse($.cookie("library"))
      var left = cookie.left
      var top = cookie.top
      $("#library").css({
        left: left + "px",
        top: top + "px",
        display: "block"
      })
    }

    // make library draggable
    $("#library").draggable({
      handle: "> hgroup",
      // save position on stop
      stop: function(e, ui) {
        $.cookie("library", JSON.stringify(ui.position), { expires: 365 })
      }
    })

    // make library items draggable
    $("#library .item").draggable({
      containment: "document",
      helper: "clone",
      scope: "column"
    })

  }
}

editor.library.initialize = {

}


// selection -----------------------------------------------------------------

editor.selection = {
  _item: null,

  clear: function(){
    $("#canvas .selected").removeClass("selected")
  },

  item: function($item){
    this._item = $item || this._item
    if ($item) {
      this.clear()
      $item.addClass("selected")
      editor.toolbar.show()
    }
    return this._item
  },

  monitor: function(){
    $("body").off("click").on("click", function(e){
      var $target = $(e.target)
      var target_is_item = ($target == editor.selection.item())
      var target_is_toolbar = $target.closest("#toolbar").length > 0
      var target_is_library = $target.closest("#library").length > 0
      if (!target_is_item && !target_is_toolbar && !target_is_library) {
        editor.toolbar.hide()
        $("#canvas .selected").removeClass("selected")
      }
    })
  }
}


// toolbar -------------------------------------------------------------------

editor.toolbar = {

  _el: null,

  init: function(){
    this.columns.init()
  },

  hide: function($el){
    this._el = null
    $("#toolbar").hide()
  },

  show: function($el){
    this.columns.load()
    $("#toolbar").show()
  },

  columns: {
    _count: 0,
    // initialize
    init: function(){
      $("#toolbar .columns a:first").on("click", function(){
        editor.toolbar.columns.down()
      })
      $("#toolbar .columns a:last").on("click", function(){
        editor.toolbar.columns.up()
      })
    },
    // update for selected element
    load: function($el){
      this.check()
      this.update()
    },
    // retrive current column count
    check: function(){
      var columns = $(editor.selection.item()).find("> .column").length
      this._count = (columns == 0) ? 1 : columns
      return this._count
    },
    count: function(){
      return this._count
    },
    // up/down count
    up: function(){
      editor.columns.add()
      this.update()
    },
    down: function(){
      if (this._count > 0) this._count--
      this.update()
    },
    // update ui
    update: function(){
      this.check()
      $("#toolbar .columns .number").html(this._count)
      if (this._count == 1) {
        $("#toolbar .columns .label").html("column")
      } else {
        $("#toolbar .columns .label").html("columns")
      }
    }
  }

}