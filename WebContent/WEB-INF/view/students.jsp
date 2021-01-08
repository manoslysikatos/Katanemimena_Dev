

        

                <div class="container-fluid">

                    

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Υποψήφιοι Διδάκτορες</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>User ID</th>
                                            <th>Ονοματεπώνυμο</th>
                                            <th>Email</th>
                                           	<th>Τηλέφωνο</th>
                                            <th>Πόντοι</th>
                                            
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <c:forEach var="tmp" items="${students}">

                                        <tr>
                                                <td>${tmp.id}</td>
                                                <td>${tmp.firstName}&nbsp;${tmp.lastName}</td>
                                                <td>${tmp.email}</td>
                                                <td>${tmp.phone}</td>
                                                <td>${tmp.getCandidate().taskPoints}</td> 
                                        </tr>
                                </c:forEach>

                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

           