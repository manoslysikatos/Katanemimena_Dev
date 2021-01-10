<!-- Begin Page Content -->
                <div class="container-fluid">
                     <!-- Page Heading -->
                     <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Προσθήκη νέου χρήστη</h1>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="password">Όνομα:</label>
                            <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                placeholder="Πληκτρολογήστε...">
                        </div>
                        <div class="col-sm-6">
                            <label for="password">Επώνυμο:</label>
                            <input type="text" class="form-control form-control-user" id="exampleLastName"
                                placeholder="Πληκτρολογήστε...">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="role">Ρόλος:</label>
                            <select id="role" name="role" class="form-control form-control-user">
                                <option value="blank">Επιλέξτε...</option>
                                <option value="student">Υποψήφιος διδάκτορας</option>
                                <option value="professor">Καθηγητής</option>
                                <option value="staff">Γραμματεία</option>
                            </select>
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="department">Τμήμα:</label>
                            <select id="department" name="role" class="form-control form-control-user">
                                <option value="blank">Επιλέξτε...</option>
                                <option value="informatics">Τμήμα Πληροφορικής</option>
                                <option value="geography">Τμήμα Γεωγραφίας και Οικονομίας</option>
                                <option value="health">Τμήμα Υγείας</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="birthday">Ημερομηνία Γέννησης:</label>
                            <input type="date" id="birthday" name="birthday" class="form-control form-control-user">
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="phone">Τηλέφωνο:</label>
                            <input type="tel" id="phone" name="phone" placeholder="123-45-678" class="form-control form-control-user"
                            pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="exampleInputEmail">Ηλεκτρονική διεύθυνση:</label>
                            <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                placeholder="Πληκτρολογήστε...">
                        </div>
                        <div class="col-sm-6">
                            <label for="password">Κωδικός:</label>
                            <form name="myform" method="post" action="" style="display:flex;">
                                <input id="password" name="row_password" type="text" size="40" class="form-control form-control-user col-sm-8" placeholder="Πληκτρολογήστε...">
                                <input type="button" value="Αυτοματοποιημένος Κωδικός" style="font-weight: bold;" onClick="randomPassword(8);" tabindex="2" class="form-control form-control-user col-sm-4">
                            </form>
                        </div>
                    </div>
	<div style="display:flex; flex-direction: column; align-items: end;">
                    <a onclick="submitForm()" class="btn btn-primary btn-user btn-block col-sm-2">
                        Δημιουργία Χρήστη
                    </a>
                    <a onclick="clearForm()" class="btn btn-secondary btn-user btn-block col-sm-2">
                        Εκκαθάριση Φόρμας
                    </a>
</div>
                
                </div>
                <!-- /.container-fluid -->
</div>
           
             <script>
        function randomPassword(length) {
        var chars = "abcdefghijklmnopqrstuvwxyz!@#$%^&*()-+<>ABCDEFGHIJKLMNOP1234567890";
        var pass = "";
        for (var x = 0; x < length; x++) {
            var i = Math.floor(Math.random() * chars.length);
            pass += chars.charAt(i);
        }
        console.log("pls")
        myform.row_password.value = pass;
        }
        
        
        function submitForm(){
        	var firstName = document.getElementById("exampleFirstName").value;
        	var lastName = document.getElementById("exampleLastName").value;
        	var role = document.getElementById("role").value;
        	var department = document.getElementById("department").value;
        	var birthday = document.getElementById("birthday").value;
        	var phone = document.getElementById("phone").value;
        	var password = document.getElementById("password").value;
        	var email = document.getElementById("exampleInputEmail").value;
        	
        	var http = new XMLHttpRequest();
        	var tmp = new FormData();
            http.open("POST", "${pageContext.request.contextPath}/api/users");
            http.onreadystatechange= function (result){
              if (http.readyState == XMLHttpRequest.DONE) {
                
                alert("done");
                
              }
            };
            
            var json = {
            		"firstName": firstName,
            		"lastName": lastName,
            		"email": email,
            		"role":role,
            		"department":department,
            		"birthday":birthday,
            		"phone":phone,
            		"password":password
            }
            /*
            tmp.append("firstName", firstName);
            tmp.append("lastName", lastName);
            tmp.append("email", email);
            tmp.append("role", role);
            tmp.append("department", department);
            tmp.append("birthday", birthday);
            tmp.append("phone", phone);
            tmp.append("password", password);
            */
            http.send(JSON.stringify(json));
            console.log(tmp);
        }
        
        function clearForm(){
        	document.getElementById("exampleFirstName").value = "";
        	document.getElementById("exampleLastName").value = "";
        	document.getElementById("role").value = "";
        	document.getElementById("department").value ="";
        	document.getElementById("birthday").value = "";
        	document.getElementById("phone").value= "";
        	document.getElementById("password").value ="";
        	document.getElementById("exampleInputEmail").value ="";
        	
        }
    </script>
            <!-- End of Main Content -->