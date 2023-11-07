ALTER PROCEDURE SP_Check_InspeccionRecepcion
AS
BEGIN
    DECLARE @pedido varchar(50)
    DECLARE @id_key_pedido int
    DECLARE @estado_cm smallint
    DECLARE @id_key_pedido_detalle int

    DECLARE cursorEstado CURSOR FOR
        SELECT Pedido, Id_key_pedido, Id_key_pedido_detalle, Estado_ControlMontaje
        FROM AUTO_Com_InspeccionRecepcion;

    OPEN cursorEstado;

    FETCH NEXT FROM cursorEstado INTO @pedido, id_key_pedido, @id_key_pedido_detalle, @estado_cm
    WHILE @@fetch status = 0
    BEGIN
        IF @estado_cm = 1
            BEGIN
            EXEC SP_Guardar_InspeccionRecepcion @pedido, @id_key_pedido_detalle
            END;
        IF @estado_cm = 2
            BEGIN
                EXEC SP_Borrar_AUTOCV_Com_InspeccionRecepcion @id_key_pedido, @id_key_pedido_detalle
            END;
        FETCH NEXT FROM cursor_name INTO @variable1, @variable2;
    END;
    CLOSE cursorEstado;
    DEALLOCATE  cursorEstado;
END;


ALTER PROCEDURE SP_Borrar_AUTO_Com_InspeccionRecepcion
    @id_key_pedido int,
    @id_key_pedido_detalle int
AS
BEGIN
    DELETE FROM AUTOCV_Com_InspeccionRecepcion WHERE Id_key_pedido = @id_key_pedido
                                                     AND Id_key_pedido_detalle = @id_key_pedido_detalle
END;

ALTER PROCEDURE SP_Guardar_InspeccionRecepcion
    @pedido  VARCHAR(50),
    @id_key_pedido_detalle int
AS
BEGIN
    IF EXISTS(SELECT pedido FROM Pedidos WHERE pedido = @pedido)
        BEGIN


            UPDATE
        end;
    IF EXISTS(SELECT pedido_compra FROM pedidos_compra WHERE pedido_compra = @pedido)
        BEGIN


            UPDATE
        end;
END;
