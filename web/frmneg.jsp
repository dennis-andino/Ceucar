<div>
    <div class="modal fade" id="negform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Negociacion de Vehiculo</h5>
                </div>
                <div class="modal-body">
                    <form method="POST" action="membDAO.jsp">
                        <div class="form-group">
                            <label for="tipot">Me interesa: </label>
                            <select id="cbpais" class="form-control" name="tipot">
                                <option value="vs" selected>Negociar precio</option>
                                <option value="mc" >Obtener Credito</option>
                                <option value="ae" >Programar cita</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="txtdigitos">Mensaje al proveedor:</label>
                            <textarea class="form-control" id="contenido" rows="6"></textarea>
                        </div>

                </div>

                <div class="modal-footer">
                    <button type="submit"  class="btn btn-primary" name="btnmem" value="adquirir">Enviar Mensaje</button>
                    </form>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</div>
