<%-- 
    Document   : ckeditor
    Created on : Dec 27, 2022, 8:58:04 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>CKEditor 5 – Classic editor</title>
        <script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/ckeditor.js"></script>
    </head>

    <body>
        <h1>Classic editor</h1>
        <form action="ckeditor" method="post">
            <div id="editor"></div>
            <input id="editor-content" type="hidden" name="editorContent">
            <div>
                <button type="submit" onclick="x()">Save</button>
            </div>
        </form>
        <script>
            let editor;

            ClassicEditor
                    .create(document.querySelector('#editor'))
                    .then(newEditor => {
                        editor = newEditor;
                        editor.setData("<h2>In other words, in the code above the editor equals:</h2><p>Actually, the error says that editor is accessible. But that's not the editor that was created. It's the #editor element because (unfortunately) elements with id attributes are accessible in the global scope via their id name.</p>");
                    })
                    .catch(error => {
                        console.error(error);
                    });



//            function x() {
//                var data = editor.getData();
//                console.log(data);
//            }
            function x() {
                var data = editor.getData();
                document.getElementById('editor-content').value = data;
            }
        </script>
    </body>

</html>