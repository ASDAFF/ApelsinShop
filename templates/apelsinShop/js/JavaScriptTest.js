var moveGroupObject = null;
var moveGroupParentObject = null;

function moveGroup (object) {
    if(moveGroupObject != null) {
        moveGroupObject.show();
    }
    moveGroupParentObject = object.parent().parent();
    moveGroupObject = object.parent();
    moveGroupObject.hide();
    $('.ImportMoveGroupButton').show();
}

function importMoveGroup (object,childrenGroups) {
    $('.ImportMoveGroupButton').hide();
    if(moveGroupObject != null && moveGroupParentObject != null) {
        object.children(".GroupTreeElementContent").children(".GroupTreeElementExpandButton").removeClass('GroupTreeHideElement');
        object.children(".GroupTreeElementContent").children(".GroupTreeElementContentText").removeClass('NoExpanded');
        object.children(".GroupTreeElementContent").children(".GroupTreeElementContentText").removeClass('Expanded');
        object.children(".GroupTreeElementContent").children(".GroupTreeElementContentText").addClass('Expanded');
        childrenGroups.append(moveGroupObject);
        moveGroupObject.show();
        var moveGroupParentHtml = moveGroupParentObject.html();
        if(moveGroupParentHtml == "" || moveGroupParentHtml == null) {
            moveGroupParentObject.parent().find(".GroupTreeElementExpandButton.GroupTreeHideElement").removeClass('GroupTreeHideElement');
            moveGroupParentObject.parent().find(".GroupTreeElementExpandButton").addClass('GroupTreeHideElement');
            moveGroupParentObject.parent().find(".GroupTreeElementContentText.NoExpanded").removeClass('NoExpanded');
            moveGroupParentObject.parent().find(".GroupTreeElementContentText.Expanded").removeClass('Expanded');
            moveGroupParentObject.parent().find(".GroupTreeElementContentText").addClass('NoExpanded');
        }
    }
    moveGroupObject = null;
    moveGroupParentObject = null;
}