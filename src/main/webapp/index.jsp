<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="plugin/jquerytoast/src/jquery.toast.css" rel="stylesheet" />
    <link href="plugin/jquerytoast/dist/jquery.toast.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #e9ecef;
            font-family: Arial, sans-serif;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        .fab {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #28a745;
            color: white;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            font-size: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            cursor: pointer;
        }
        .modal-header {
            background-color: #007bff;
            color: white;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .toast-success {
            background-color: #28a745;
            color: white;
        }
        .toast-error {
            background-color: #dc3545;
            color: white;
        }
    </style>

</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4 text-primary">Book Management</h2>

    <!-- Book Table Card -->
    <div class="card">
        <div class="card-header">
            Book List
        </div>
        <table class="table table-dark table-striped table-hover ">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Publisher</th>
                <th scope="col">ISBN</th>
                <th scope="col">ACTION</th>
            </tr>
            </thead>
            <tbody class="table-success" id="viewBook">


            </tbody>
        </table>
        <div class="card-body">

        </div>
    </div>
</div>

<!-- Floating Action Button (FAB) to add a book -->
<div class="fab" data-bs-toggle="modal" data-bs-target="#addBookModal">
    <i class="fas fa-plus"></i>
</div>

<!-- Modal for Add Book -->
<div class="modal fade" id="addBookModal" tabindex="-1" aria-labelledby="addBookModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBookModalLabel">Add New Book</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addbook">
                    <div class="mb-3">
                        <label for="bookName" class="form-label">Book Name</label>
                        <input type="text" class="form-control" id="bookName" name="bookName" required>
                        <input type="hidden" name="event" value="addbookdb">
                    </div>
                    <div class="mb-3">
                        <label for="author" class="form-label">Author</label>
                        <input type="text" class="form-control" id="author" name="author" required>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="number" class="form-control" id="price" name="price" step="0.01" required>
                    </div>
                    <div class="mb-3">
                        <label for="publisher" class="form-label">Publisher</label>
                        <input type="text" class="form-control" id="publisher" name="publisher" required>
                    </div>
                    <div class="mb-3">
                        <label for="isbn" class="form-label">ISBN</label>
                        <input type="text" class="form-control" id="isbn" name="isbn" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!--modal 2 -->
<div class="modal fade" id="addBookModal2" tabindex="-1" aria-labelledby="addBookModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBookModalLabel2">Add New Book</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updatebook2">
                    <div class="mb-3">
                        <label for="bookName" class="form-label">Book Name</label>
                        <input type="text" class="form-control" id="bookName2" name="bookName" required>
                    </div>
                    <div class="mb-3">
                        <label for="author" class="form-label">Author</label>
                        <input type="text" class="form-control" id="author2" name="author" required>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="number" class="form-control" id="price2" name="price" step="0.01" required>
                        <input type="hidden" id="id2" name="id2" value="">
                        <input type="hidden" name="event" value="updatebook">

                    </div>
                    <div class="mb-3">
                        <label for="publisher" class="form-label">Publisher</label>
                        <input type="text" class="form-control" id="publisher2" name="publisher" required>
                    </div>
                    <div class="mb-3">
                        <label for="isbn" class="form-label">ISBN</label>
                        <input type="text" class="form-control" id="isbn2" name="isbn" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="plugin/jquerytoast/src/jquery.toast.js"></script>
<script src="plugin/jquerytoast/dist/jquery.toast.min.js"></script>
<script>
    $(document).ready(function(){
        $("#addbook").submit(function(event){
            event.preventDefault(); // Prevent the form from submitting the traditional way

            var formData = $(this).serialize(); // Serialize the form data

            $.ajax({
                url: "bookServlet", // URL of the servlet
                type: "POST", // Method type
                data: formData, // Form data to be sent
                success: function(response){
                    if(response.trim() == "done"){
                        $.toast({
                            text: "Book Added Successfully",
                            heading: 'Success',
                            icon: 'success',
                            showHideTransition: 'fade',
                            allowToastClose: true,
                            hideAfter: 5000,
                            stack: 5,
                            position: 'top-center',
                            textAlign: 'left',
                            loader: true,
                            loaderBg: '#9EC600',
                            bgColor: '#28a745'
                        });
                        $('#addbook')[0].reset();
                    } else {
                        $.toast({
                            text: "Failed to Add Book",
                            heading: 'Error',
                            icon: 'error',
                            showHideTransition: 'fade',
                            allowToastClose: true,
                            hideAfter: 5000,
                            stack: 5,
                            position: 'top-center',
                            textAlign: 'left',
                            loader: true,
                            loaderBg: '#dc3545',
                            bgColor: '#dc3545'
                        });
                        $('#addbook')[0].reset();
                    }
                },
                error: function(){
                    $.toast({
                        text: "Server Error",
                        heading: 'Error',
                        icon: 'error',
                        showHideTransition: 'fade',
                        allowToastClose: true,
                        hideAfter: 5000,
                        stack: 5,
                        position: 'top-center',
                        textAlign: 'left',
                        loader: true,
                        loaderBg: '#dc3545',
                        bgColor: '#dc3545'
                    });
                    $('#addbook')[0].reset();
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function() {
        $.ajax({
            url: "bookServlet",
            type: "POST",
            data:{"event":"viewBook"},
            dataType:'JSON',
            success: function(response) {
                let s="";
                let i=1;
                for(var key in response){
                    if (response.hasOwnProperty(key)) {
                       // console.log(response[key])

                        s+="<tr>";

                        s+="<td>"+response[key].id+"</td>";
                        s+="<td>"+response[key].name+"</td>";
                        s+="<td>"+response[key].author+"</td>";
                        s+="<td>"+response[key].price+"</td>";
                        s+="<td>"+response[key].publisher+"</td>";
                        s+="<td>"+response[key].isbn+"</td>";
                        s+="<td>";
                        s+="<a class='bookEdit btn btn-primary' id='"+response[key].id+"' >Edit</a>&nbsp;&nbsp;";
                        s+="<a class='bookdelete btn btn-danger' id='"+response[key].id+"' >Delete</a>";
                        s+="</td>";
                        s+="</tr>";
                    }
                    i++;
                }
                $('#viewBook').html(s);
            },
            error: function(jqXHR, textStatus, errorThrown) {

                console.error("Error: " + textStatus, errorThrown);
            }
        });
    });
</script>
<script>
    $(document).on('click', '.bookdelete', function() {
        var id = $(this).attr('id');
        if (confirm('Are you sure you want to delete this?')) {
            $.ajax({
                type: "POST", // Corrected method usage
                url: "bookServlet",
                data: { "id": id, "event": "deleteBook" }, // Sending ID and event to server
                success: function(response) {
                    if (response.trim() === "done") {
                        alert("Book deleted");
                        location.reload(); // Reload page to reflect changes

                    } else {
                        $.toast({
                            text: "Book Not Deleted",
                            heading: 'Note',
                            icon: 'error',
                            showHideTransition: 'fade',
                            allowToastClose: true,
                            hideAfter: 5000,
                            stack: 5,
                            position: 'top-center',
                            textAlign: 'left',
                            loader: true,
                            loaderBg: '#9EC600',
                        });
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    $.toast({
                        text: "Something went wrong on the server!",
                        heading: 'Error',
                        icon: 'error',
                        showHideTransition: 'fade',
                        allowToastClose: true,
                        hideAfter: 5000,
                        stack: 5,
                        position: 'top-center',
                        textAlign: 'left',
                        loader: true,
                        loaderBg: '#9EC600',
                    });
                }
            });
        }
    });

</script>
<script type="text/javascript">
    $(document).on('click','.bookEdit',function(){
     let id=$(this).attr('id');
        $('#addBookModal2').modal('show');
        $.ajax({
            type:"Post",
            url:"bookServlet",
            data:{"id":id,"event":"editBook"},
            dataType:"JSON",
            success: function(response) {
               // alert(response);
                $("#bookName2").val(response[0].name);
                $("#author2").val(response[0].author);
                $("#price2").val(response[0].price);
                $("#publisher2").val(response[0].publisher);
                $("#isbn2").val(response[0].isbn);
                $("#id2").val(response[0].id);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $.toast({
                    text: "Something went to wrong on server! ",
                    heading: 'Note',
                    icon: 'error',
                    showHideTransition: 'fade',
                    allowToastClose: true,
                    hideAfter: 5000,
                    stack: 5,
                    position: 'top-center',
                    textAlign: 'left',
                    loader: true,
                    loaderBg: '#9EC600',
                });
            }
        });


    })
</script>
<script>

    $(document).ready(function(){
        $("#updatebook2").submit(function(event){
            event.preventDefault();
            var formData = $(this).serialize();
            $.ajax({
                url: "bookServlet",
                type: "POST",
                data: formData,
                success: function(response){
                    if(response.trim()=="done"){
                        alert("Successfully updated");
                        window.location.href="index.jsp";
                    }else{
                        alert("Failed to update !");
                    }
                },
                error: function(){
                    $.toast({
                        text: "Something went to wrong on server! ",
                        heading: 'Note',
                        icon: 'error',
                        showHideTransition: 'fade',
                        allowToastClose: true,
                        hideAfter: 5000,
                        stack: 5,
                        position: 'top-center',
                        textAlign: 'left',
                        loader: true,
                        loaderBg: '#9EC600',
                    });

                }
            });
        });
    });

</script>
</body>
</html>
