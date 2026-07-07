$(() => {

	// http://127.0.0.1:8080/hipermedia/ login
	//let base_url = location.href.split('index')[0];

	$(document).ready(function () {
		console.log("Base URL detectada: ", base_url);

	});

	// Validando la url para la clase active del navbar form_open
	let pathname = window.location.pathname || "";



	let EDITOR;

	function ckeditor() {
		ClassicEditor.create(document.querySelector('.editor'), {
			ckfinder: {
				// CAMBIA ESTA LÍNEA:
				uploadUrl: `${base_url}ContenidoController/upload_image`,
				// El resto de opciones de CKFinder se pueden quitar si no usas el gestor completo
			}
		})
			.then((editor) => {
				EDITOR = editor;
				$('#mdb-preloader').addClass('loaded');
				$('.animacion').addClass('animated fadeIn');

				const wordCountPlugin = editor.plugins.get('WordCount');
				const wordCountWrapper = document.getElementById('word-count');
				wordCountWrapper.appendChild(wordCountPlugin.wordCountContainer);
			})
			.catch((e) => {
				toastr.error('Algo ha ocurrido cargando CKEDITOR');
				console.log(e);
			})
	}

	let EDITOR_ASIGNACION;

	function ckeditor_asignacion() {
		let elemento = document.querySelector('#editor_asignacion');

		// Solo lo inicializamos si el elemento existe en la vista actual pathname
		if (elemento) {
			ClassicEditor.create(elemento, {
				ckfinder: {
					uploadUrl: `${base_url}ContenidoController/upload_image`,
				}
			})
				.then((editor) => {
					EDITOR_ASIGNACION = editor; // Guardamos la instancia aquí
				})
				.catch((e) => {
					toastr.error('Algo ha ocurrido cargando CKEDITOR en asignaciones');
					console.log(e);
				});
		}
	}

	let EDITOR_EDIT_ASIGNACION;

	function ckeditor_edit_asignacion() {
		let elemento = document.querySelector('#edit_editor_asignacion');

		// Solo inicializamos si el elemento existe y no se ha inicializado ya pathname
		if (elemento && !EDITOR_EDIT_ASIGNACION) {
			ClassicEditor.create(elemento, {
				ckfinder: {
					uploadUrl: `${base_url}ContenidoController/upload_image`,
				}
			})
				.then((editor) => {
					EDITOR_EDIT_ASIGNACION = editor;
				})
				.catch((e) => {
					console.log("Error cargando CKEDITOR en edición:", e);
				});
		}
	}


	$.get(`${base_url}getsession`)
		.done((data) => {

			// sesion activa en el servidor
			if (data.session) {

				// inicializacion de metodos
				$('.mdb-select').materialSelect()
				$('#fecha').pickadate({
					monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
					monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
					weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
					weekdaysShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
					today: 'Hoy',
					clear: 'Limpiar',
					close: 'Cerrar',
					labelMonthNext: 'Mes siguiente',
					labelMonthPrev: 'Mes anterior',
					labelMonthSelect: 'Selecciona un mes',
					labelYearSelect: 'Selecciona un año',
					formatSubmit: 'yyyy-mm-dd',
					min: new Date()
				});
				$('#temporizador').pickatime({
					donetext: 'Hecho',
					cleartext: 'Limpiar'
				});
				$('[data-toggle="tooltip"]').tooltip();
				$('[data-toggle="popover-hover"]').popover({
					html: true,
					placement: 'top',
					trigger: 'hover',
				});

				var i = 0;
				let dtEstudiates = $('#dtestudiantes').DataTable({
					ajax: {
						type: 'get',
						url: `${base_url}traer_estudiantes`,
						dataSrc: '',
					},
					columns: [
						{
							render: function () {
								return `${i++}`
							}
						},
						// { data: 'idpersona'},
						{ data: 'cedula' },
						{ data: 'nombre' },
						{ data: 'apellido' },
						{ data: 'correo' },
						{ data: 'telefono' },
						{
							render: function (data, type, row, meta) {
								return `
							<button data-pos="${meta.row}" data-idpersona="${row.idpersona}" data-idusuario="${row.idusuario}" class="btn px-2 btn-md btn-warning waves-effect edit" data-toggle="modal" data-target="#editModal">
								<i class="fas fa-edit"></i>
							</button>
							<button data-pos="${meta.row}" data-idpersona="${row.idpersona}" data-idusuario="${row.idusuario}" class="btn px-2 btn-md btn-danger waves-effect elim" data-toggle="modal" data-target="#elimModal">
								<i class="fas fa-trash"></i>
							</button>
						`
							}
						}
					],
				});
				// $('.dataTables_length').addClass('bs-select')
				$('#dtVisitas').DataTable();

				let idusuario, idpersona, data;

				dtEstudiates.on('draw', (e) => {
					$('.edit').click(function () {
						idpersona = $(this).data('idpersona');
						idusuario = $(this).data('idusuario');
						let pos = $(this).parents('td').siblings()[0].textContent;

						$('#idpersona').val(idpersona);
						$('#idusuario').val(idusuario);

						data = dtEstudiates.row(pos).data();

						$('#cedula').val(data.cedula);
						$('#nombre').val(data.nombre);
						$('#apellido').val(data.apellido);
						$('#telefono').val(data.telefono);
						$('#email').val(data.correo);
					});

					$('.elim').click(function () {
						idpersona = $(this).data('idpersona')
						idusuario = $(this).data('idusuario')

						$('#idusuariodel').val(idusuario)
					});
				});


				$('#editarForm').submit(function (e) {
					e.preventDefault();

					let postdata = {
						hiddenEmail: data.correo,
						nombre: $('#nombre').val(),
						apellido: $('#apellido').val(),
						correo: $('#email').val(),
						telefono: $('#telefono').val(),
						idusuario: idusuario,
						idpersona: idpersona
					}

					// console.log(postdata);

					$.post(`${base_url}updateProfile`, postdata, (success) => {
						dtEstudiates.ajax.reload();
						toastr.success('Información actualizada correctamente');
						$('#editModal').modal('hide');
						i = 0;
					})
						.fail((er) => {
							console.log(er.responseText);
							toastr.error(er.statusText);
						});
				});

				$('#eliminarForm').submit((e) => {
					e.preventDefault();

					let ids = { idusuario: $('#idusuariodel').val() }

					$.post(`${base_url}deleteProfile`, ids, function (msj) {
						dtEstudiates.ajax.reload();
						$('#elimModal').modal('hide');
						toastr.success(msj);
						i = 0;
					})
						.fail((er) => {
							console.log(er.responseText);
							toastr.error(er.statusText);
						});
				});


				// SideNav: Responsive initialization
				$(document).ready(function () {

					function initSideNav() {
						if ($(window).width() < 992) {
							// Mobile: slide-out overlay behavior
							$(".button-collapse").sideNav({
								menuWidth: 260,
								edge: 'left',
								closeOnClick: true
							});
						} else {
							// Desktop/Tablet: Always visible - call sideNav just to initialize
							// the library but the CSS keeps it open via transform: translateX(0)
							if (typeof $.fn.sideNav === 'function') {
								$(".button-collapse").sideNav({
									menuWidth: 260,
									edge: 'left'
								});
							}
						}
					}

					initSideNav();

					// Re-initialize on window resize
					var resizeTimer;
					$(window).on('resize', function () {
						clearTimeout(resizeTimer);
						resizeTimer = setTimeout(initSideNav, 150);
					});

					// Inicialización del Scrollbar con manejo de error
					let sideNavScrollbar = document.querySelector('.custom-scrollbar');
					if (sideNavScrollbar && typeof PerfectScrollbar !== 'undefined') {
						let ps = new PerfectScrollbar(sideNavScrollbar);
					}

					// Active link highlighting based on current URL
					var currentPath = window.location.pathname;
					$('.side-nav .collapsible-header').each(function () {
						var href = $(this).attr('href');
						if (href && currentPath.indexOf(href.split('/').pop()) > -1 && href !== '#') {
							$(this).addClass('active');
						}
					});
				});


				// if kare's owner
				if (false) {


				}
				else {

					// Clase active del navbar
					// if( pathname.endsWith('/docente/contenidos') ){
					// 	$('.nav-item.active').removeClass('active');
					// 	$('.collapsible-header.active').removeClass('active');
					// 	$('#contenido').addClass('active');
					// }
				}


				// Mostrar temas y contenido del lapso
				$('.ver_contenido').click(function (e) {
					let info = { idtema: $(this).data('idtema') }

					$.post(`${base_url}traer_contenido`, info, (contenido) => {

						$('#content').html(`
						${contenido[0].contenido}
					`)
					})
						.fail((er) => {
							console.log(er.responseText);
							toastr.error(er.statusText);
						});
				});


				/*
				$('.borrartema').click(function () {
					let idtema = $(this).data('idtema');
					// let idcontenido = $(this).data('idcontenido');

					$.post(`${base_url}delTemaContenido`, { idtema: idtema }, (data) => {

						if (data == 'nop') {
							toastr.error('No tienes permiso para borrarlo.');
						}
						else {
							$(this).parents('.content').remove();
							// $('#content').html('');
							toastr.success(data);
						}
					})
						.fail((error) => {
							console.log(error.responseText);
							toastr.error(error.statusText);
						});
				});

*/


				$('.borrartema').click(function () {
					let idtema = $(this).data('idtema');
					// Guardamos la referencia del botón en una variable por seguridad
					let btn = $(this);

					// Lanzamos la confirmación antes de ejecutar el AJAX
					if (confirm("¿Estás seguro de que deseas borrar este tema? Esta acción no se puede deshacer.")) {

						$.post(`${base_url}delTemaContenido`, { idtema: idtema }, (data) => {
							if (data == 'nop') {
								toastr.error('No tienes permiso para borrarlo.');
							} else {
								// Usamos la referencia 'btn' guardada anteriormente
								btn.parents('.content').remove();
								toastr.success(data);
							}
						})
							.fail((error) => {
								console.log(error.responseText);
								toastr.error(error.statusText);
							});

					} else {
						// Si el usuario presiona "Cancelar", no hacemos nada
						return false;
					}
				});




				//--------------------------- bonito

				/*$('.borrartema').click(function () {
					let idtema = $(this).data('idtema');
					let btn = $(this);
				
					Swal.fire({
						title: '¿Estás seguro?',
						text: "¡No podrás revertir esta acción!",
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: 'Sí, borrar'
					}).then((result) => {
						if (result.isConfirmed) {
							// Aquí ejecutamos tu petición AJAX
							$.post(`${base_url}delTemaContenido`, { idtema: idtema }, (data) => {
								if (data == 'nop') {
									toastr.error('No tienes permiso para borrarlo.');
								} else {
									btn.parents('.content').remove();
									toastr.success(data);
									Swal.fire('Borrado!', 'El tema ha sido eliminado.', 'success');
								}
							}).fail((error) => {
								toastr.error(error.statusText);
							});
						}
					});
				});*/


				//-------------------



				// $('.lapsos').click( function(e) {
				// 	$('#content').html('');

				// 	// let temaid    = $(this).children('div[data-temaid]').data('temaid')

				// 	let data = {
				// 		lapso: $(this).children('.lapso').text(),
				// 		seccion: $(this).children('div[data-seccion]').data('seccion')
				// 	}

				// 	$.post(`${base_url}traer_temas`, data, (temas) => {

				// 		$('#temaContenido').html('');

				// 		console.log(temas)

				// 		for (c of temas) {
				// 			$('#temaContenido').append(`
				// 				<div class="content">
				// 					<div class=" mb-3">
				// 						<div class="card asd">
				// 							<div class="card-header p-0">
				// 								<button data-idtema="${c.idtema}" class="borrartema btn btn-sm btn-flat waves-effect red-text">
				// 									<i class="fas fa-times"></i>
				// 								</button>
				// 							</div>
				// 							<a class="tema" href="#" data-tema="${c.tema}" data-idtema="${c.idtema}">
				// 								<div class="card-body">
				// 									<p class="text-center lead">${c.tema}</p>
				// 								</div>
				// 							</a>
				// 						</div>
				// 					</div>
				// 				</div>
				// 			`);
				// 		}

				// 		$('.borrartema').click(function(){
				// 			let idtema = $(this).data('idtema');
				// 			// let idcontenido = $(this).data('idcontenido');

				// 			$.post(`${base_url}delTemaContenido`, { idtema: idtema }, (data) => {

				// 				if (data == 'nop') {
				// 					toastr.error('No tienes permiso para borrarlo.');
				// 				}
				// 				else {
				// 					$(this).parents('.content').remove();
				// 					$('#content').html('');
				// 					toastr.success(data);
				// 				}
				// 			})
				// 			.fail((error) => {
				// 				console.log(error.responseText);
				// 				toastr.error(error.statusText);
				// 			});
				// 		});

				// 		$('.tema').click(function(e) {
				// 			let info = { idtema: $(this).data('idtema') }

				// 			$.post(`${base_url}traer_contenido`, info, (contenido) => {

				// 				$('#content').html(`
				// 					${contenido[0].contenido}
				// 				`)

				// 				$('.tema').parents('.asd').removeClass('elegant-color');
				// 				$(this).parents('.asd').addClass('elegant-color');
				// 			})
				// 			.fail((er) => {
				// 				console.log(er.responseText);
				// 				toastr.error(er.statusText);
				// 			});
				// 		});

				// 		$('.lapsos').parents('.card-body').removeClass('elegant-color');
				// 		// $(this).children('h3').removeClass('white-text')

				// 		$(this).parents('.card-body').addClass('elegant-color');
				// 		$(this).children('h3').addClass('white-text');

				// 	})
				// 	.fail((er) => {
				// 		console.log(er);
				// 		toastr.error(er.statusText);
				// 	});
				// });
			}
		})
		.fail((er) => {
			console.log(er.responseText);
			toastr.error(er.statusText);
		});


	if (pathname) {
		if (pathname.endsWith('/docente/contenidos')) {
			$('.collapsible-header.active').removeClass('active');
			$('#contenido').addClass('active');

			ckeditor();
		}

		// // activar la clase active en el enlace de las rutas (modulos) para el usuario docente
		if (pathname.endsWith('/estudiante')) {
			$('.collapsible-header.active').removeClass('active'); // k => sidebar
			$('#inicio').addClass('active');
		}
		else if (pathname.endsWith('/estudiante/contenidos')) {
			$('.collapsible-header.active').removeClass('active'); // k => sidebar
			$('#contenido').addClass('active');
		}
		else if (pathname.endsWith('estudiante/evaluaciones')) {
			sessionStorage.clear();
			$('.collapsible-header.active').removeClass('active'); // k => sidebar
			$('#evaluaciones').addClass('active');
		}
		else if (pathname.endsWith('/simuladores')) {
			$('.collapsible-header.active').removeClass('active'); // k => sidebar
			$('#simulador').addClass('active');
		}
		else if (pathname.endsWith('asignaciones')) {
			$('.collapsible-header.active').removeClass('active'); // k => sidebar
			$('#asignaciones').addClass('active');
			ckeditor_asignacion();
			ckeditor_edit_asignacion();
		}


		if (pathname.endsWith('/docente')) {
			$('.collapsible-header.active').removeClass('active'); // k => sidebar
			$('#inicio').addClass('active');
		}
		else if (/contenido\/[0-9]+$/.test(pathname)) {

			$('.collapsible-header.active').removeClass('active');
			$('#contenido').addClass('active');
		}
		// else if ( pathname.endsWith('/contenido/crear') ){
		//
		// 	$('.collapsible-header.active').removeClass('active');
		// 	$('#contenido').addClass('active');

		// 	ckeditor();
		// }
		else if (pathname.endsWith('/estudiantes')) {

			$('.collapsible-header.active').removeClass('active');
			$('#alumnos').addClass('active');
		}
		else if (pathname.endsWith('evaluaciones')) {

			$('.collapsible-header.active').removeClass('active');
			$('#examenes').addClass('active');
		}
		else if (/evaluacion\/[0-9]+$/.test(pathname)) {

			$('.collapsible-header.active').removeClass('active');
			$('#examenes').addClass('active');
		}
		else if (pathname.endsWith('/recursos')) {

			$('.collapsible-header.active').removeClass('active');
			$('#repositorio').addClass('active');
		}
		else if (pathname.endsWith('/herramientas')) {

			$('.collapsible-header.active').removeClass('active');
			$('#herramientas').addClass('active');
		}
		// else {
		// 	$('.nav-item.active').removeClass('active')
		// 	$('.collapsible-header.active').removeClass('active')
		// }
	}

	/*********************************************************************************************************************************************
	****** EST CODIGO SE EJECUTA CUANDO SE TIENE UNA SESION ACTIVA EN EL SERVIDOR Y TRAE LA KEY OWNER DEL ARRAY EN EL ARCHIVO DE CONFGURACION ****
	**********************************************************************************************************************************************/

	// ==================================================
	// LOGICA PARA CALIFICAR PREGUNTAS DE DESARROLLO
	// ==================================================

	// 1. Cargar datos cuando se abre el modal
	$('#modalCorregirDesarrollo').on('shown.bs.modal', function () {
		cargarPendientesDesarrollo();
	});

	function cargarPendientesDesarrollo() {
		$('#contenedorRespuestasPendientes').html('<div class="text-center my-5"><i class="fas fa-circle-notch fa-spin fa-3x text-primary"></i><p class="mt-2">Cargando respuestas...</p></div>');

		$.get(`${base_url}common/ExamenController/respuestas_pendientes`, function (data) {
			let respuestas = JSON.parse(data);
			let html = '';

			if (respuestas.length > 0) {
				respuestas.forEach((r) => {
					html += `
                <div class="card mb-4 border-0 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="mb-0 text-primary"><i class="fas fa-user-graduate mr-2"></i>${r.nombre} ${r.apellido} (${r.cedula})</h5>
                            <span class="badge badge-info p-2">${r.tema}</span>
                        </div>
                        <div class="p-3 rounded" style="background-color: #f1f5f9;">
                            <p class="font-weight-bold mb-2">Pregunta:</p>
                            <p class="mb-0 text-dark">${r.pregunta}</p>
                        </div>
                        <div class="p-3 mt-3">
                            <p class="font-weight-bold mb-2 text-success">Desarrollo del alumno:</p>
                            <p class="mb-0">${r.respuesta_texto}</p>
                        </div>
                        <hr>
                        <form class="formCalificarDesarrollo">
                            <input type="hidden" name="id_respuesta" value="${r.id_respuesta}">
                            <input type="hidden" name="id_examen_tomado" value="${r.examen_tomado_id}">
                            <div class="form-row align-items-end">
                                <div class="col-md-4">
                                    <label class="text-muted small">Puntos a asignar (Máximo: ${r.valor_maximo})</label>
                                    <input type="number" name="puntos" class="form-control" max="${r.valor_maximo}" min="0" required>
                                </div>
                                <div class="col-md-8 text-right">
                                    <button type="submit" class="btn btn-primary btn-md"><i class="fas fa-check mr-2"></i>Guardar Calificación</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>`;
				});
			} else {
				html = '<h4 class="text-center my-5 text-muted"><i class="fas fa-check-circle fa-2x mb-3 text-success d-block"></i>¡Todo al día! No tienes respuestas por corregir.</h4>';
			}
			$('#contenedorRespuestasPendientes').html(html);
		}).fail(function () {
			$('#contenedorRespuestasPendientes').html('<h5 class="text-center text-danger my-5">Ocurrió un error al cargar los datos.</h5>');
		});
	}

	// 2. Enviar calificación por AJAX
	$(document).on('submit', '.formCalificarDesarrollo', function (e) {
		e.preventDefault();
		let formData = $(this).serialize();
		let btnSubmit = $(this).find('button[type="submit"]');

		btnSubmit.attr('disabled', true).html('<i class="fas fa-spinner fa-spin mr-2"></i>Guardando...');

		$.post(`${base_url}calificar_respuesta_examen`, formData, function (res) {
			toastr.success('Calificación guardada y sumada al examen.');
			cargarPendientesDesarrollo(); // Recargamos la lista automáticamente
		}).fail(function () {
			toastr.error('Error al guardar la calificación.');
			btnSubmit.attr('disabled', false).html('<i class="fas fa-check mr-2"></i>Guardar Calificación');
		});
	});

	// ------------------------------ LOGICA DEL LOGIN, REGISTRO DE USUARIOS Y RESETEO DE CONTRASEÑA --------------------------------------------

	// Comprobar los credenciales de login
	$(document).ready(function () {
		console.log("App.js cargado. Base URL:", base_url);

		$('#loginform').submit(function (e) {
			e.preventDefault(); // AHORA SÍ debería detener la URL

			console.log("Formulario capturado");
			let data = $(this).serialize();

			// Usamos base_url sin index.php porque ya tienes el .htaccess en la raíz
			$.post(base_url + 'login', data, function (d) {
				if (d.code == 200) {
					location.assign(base_url + (d.type == 'Estudiante' ? 'estudiante' : 'docente'));
				} else {
					toastr.error(d.message);
				}
			}, 'json')
				.fail(function (err) {
					console.error("Error en la petición:", err.responseText);
				});
		});
	});
	// Registrar un usuario docente nuevo side
	$('#registerform').submit(function (e) {
		e.preventDefault();

		let data = $(this).serialize()

		$.post(`${base_url}register`, data, function (d) {

			if (d[0] == 'success') {

				$('#cedula').val('');
				$('#nombre').val('');
				$('#apellido').val('');
				$('#correo').val('');
				$('#telefono').val('');
				$('#seccion').val('');
				$('#clave').val('');

				$('#registro').modal('hide');

				toastr.success(d[1]);

				setTimeout(() => {
					if (pathname.endsWith('/registrar')) {
						location.assign(`${base_url}`);
					}
				}, 2000);
			}
			else {
				toastr.error(d[1]);
			}

		})

			.fail(er => {
				console.log(er.responseText);
				toastr.error(er.statusText);
			})
	});

	$('#recuperar_contrasena').submit((e) => {
		e.preventDefault();

		$.ajax({
			method: 'post',
			url: `${base_url}recuperar_contrasena`,
			data: $(e.target).serialize(),
			timeout: 20000,
			beforeSend() {
				$('#basic-addon1').html('<i class="fas fa-circle-notch fa-pulse"></i>');
			}
		})
			.done((data) => {
				console.log(data);
				$('#basic-addon1').html('<i class="fas fa-envelope"></i>');
				if (data[0] == true) {
					toastr.success("Revisa tu bandeja de entrada, te ha llegado un enlace con el cual puedes restablecer tu contraseña.");
					$('#sendCorreo').val('');
					return;
				}
				else if (data[0] == '404') {
					toastr.error('Este correo no está registrado.');
					return;
				}

				// Algun error enviando el correo
				toastr.error('Hubo un error al enviar el correo.');
				console.log(data);
			})
			.fail((er, textStatus) => {
				console.log(er.responseText);

				$('#basic-addon1').html('<i class="fas fa-envelope"></i>');

				if (textStatus == 'timeout') {
					toastr.error('Se ha excedido el tiempo, inténtalo más tarde.');
				}
				else {
					toastr.error('Hubo un error al enviar el correo, tal vez sea la conexión a internet, contáctate con el administrador del sitio.');
				}
			})
	});

	$('#restore_password').submit((e) => {
		e.preventDefault();

		let correo = location.search.split('=')[1];
		let clave = $('#pass').val();

		let data = { correo, clave }

		if (correo) {

			$.post(`${base_url}cambiar_clave`, data, (data) => {

				toastr.success(data);
				$('#pass').val('');
			})
				.fail((er) => {
					console.log(er.responseText);
					toastr.error(er.statusText);
				});
		}
		else {
			toastr.error('La URL no es válida');
		}
	});

	// valiar que la cedula ingresada no exista
	$('.cedula').keyup(function (e) {

		$.post(`${base_url}verificar_cedula`, { cedula: $(this).val() })
			.done((d) => {
				if (d) {
					$(this).addClass('is-invalid');
					$('.cimsg').text(d);
					$('#registerbtn').attr('disabled', 'true');
				}
				else {
					$(this).removeClass('is-invalid');
					$('.cimsg').text('');
					if (!$('.correo').hasClass('is-invalid')) {
						$('#registerbtn').removeAttr('disabled');
					}
				}
			})

			.fail((error) => {
				console.log(error);
			});
	});

	// valiar que el correo ingresado no exista
	$('.correo').keyup(function (e) {

		$.post(`${base_url}verificar_correo`, { correo: $(this).val() })
			.done((d) => {
				// d = El correo se encuantra registrado
				if (d) {
					$(this).addClass('is-invalid');
					$('.cemsg').text(d);
					$('#registerbtn').attr('disabled', 'true');
				}
				else {
					$(this).removeClass('is-invalid');
					$('.cemsg').text('');

					if (!$('.cedula').hasClass('is-invalid')) {
						$('#registerbtn').removeAttr('disabled');
					}
				}
			})

			.fail((error) => {
				console.log(error.responseText);
				toastr.error(error.statusText);
			})
	});


	// ------------------------------ LOGICA PARA REGISTRAR ESTUDIANTES --------------------------------------------

	$('#formaddestudiantes').submit((e) => {
		e.preventDefault();

		let data = $(e.target).serialize();

		$.post(`${base_url}anadir_estudiante`, data, function (d) {

			console.log(d);

			$('#cedulaest').val('');
			$('#nombreest').val('');
			$('#apellidoest').val('');
			$('#emailest').val('');
			$('#phoneest').val('');

			$('#addestudent').modal('hide');
			toastr.success(d);
			$('#dtestudiantes').DataTable().ajax.reload();
		})
			.fail((err) => {
				toastr.error(err.statusText);
				console.log(err.responseText);
			});
	});


	// ------------------------------ LOGICA PARA EL EXAMEN (PROFESOR) ----------------------------------------

	var c = 1;

	// SELECCIONAR EL TIPO DE PREGUNTA
	function tipo_pregunta(c = 1) {

		if (c < 1) { c = 1 }

		$('.tipo_pregunta').change(function () {

			let resp = $(this).parents('.form-row').children('.col-md-3').children('.resp');

			if ($(this).val() == 'Seleccion_Simple') { // seleccion simple

				if ($(this).parents('.card-body').children('.respinco').children('.asd')) {
					$(this).parents('.card-body').children('.respinco').children('.asd').remove();
				}

				$(this).parents('.card-body').children('.respinco').append(`
					<div class="form-row mt-3 asd">
						<div class="col-md-3 col-sm-6">
							<label for="">Respuesta incorrecta 1</label>
							<input type="text" name="resp_inc_1-${c}" class="form-control campo" required />
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="">Respuesta incorrecta 2</label>
							<input type="text" name="resp_inc_2-${c}" class="form-control campo" required />
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="">Respuesta incorrecta 3</label>
							<input type="text" name="resp_inc_3-${c}" class="form-control campo" required />
						</div>
						<div class="col-md-3 col-sm-6">
							<label for="">Respuesta incorrecta 4</label>
							<input type="text" name="resp_inc_4-${c}" class="form-control campo" required />
						</div>
					</div>
				`);

				resp.children().remove();
				resp.append(`
					<label for="">Respuesta correcta</label>
					<input type="text" class="form-control campo" name="resp-${c}" required />
				`);
			}
			else if ($(this).val() == 'Verdadero_o_Falso') {
				resp.children().remove();

				resp.append(`
					<label>La respuesta</label>
					<select name="resp-${c}" class="browser-default custom-select" required>
						<option value="verdadero">Verdadero</option>
						<option value="falso">Falso</option>
					</select>
				`);

				$(this).parents('.card-body').children('.respinco').children().remove();
			}
			// AÑADE ESTA NUEVA CONDICIÓN
			else if ($(this).val() == 'Desarrollo') {
				resp.children().remove();

				resp.append(`
            <label>Respuesta (Opcional/Guía)</label>
            <textarea name="resp-${c}" class="form-control campo" rows="1" placeholder="Ej: Palabras clave esperadas"></textarea>
        `);

				// Removemos las respuestas incorrectas si venía de selección simple
				$(this).parents('.card-body').children('.respinco').children().remove();
			}
		})
	}
	tipo_pregunta();

	// AÑADIR MAS PREGUNTAS
	$('#addPregunta').click((e) => {
		// Validar que c no sea un nro negativo
		if (c < 1) { c = 1 }

		//------------------ VALIDACIONES DE LAS PREGUNTAS --------------------------

		// Validar que todos los campos esten llenos antes de continuar con la otra pregunta
		let campos = $(e.target).parents('form').find('.form-control, .custom-select');
		let bool = false;

		// Validarsi el campo tiene un valor, en caso contrario le pone la clase is-invalid
		campos.each((i, el) => {
			if ($(el).val() == '') {
				toastr.error('Completa todos los campos anteriores.');
				$(el).addClass('is-invalid');
				bool = true;
				return false;
			}
		});
		//Salir de la funcion principal en caso de que los campos esten vacios
		if (bool) { return }
		// QUitar la clase is-invalid en caso de que el campo tenga un valor
		campos.each((i, el) => {
			if ($(el).hasClass('is-invalid')) {
				$(el).removeClass('is-invalid');
			}
		});

		let puntuacion = $('#puntuacion').val(), valorTotal = 0;

		// Validar que no se pueda introducir otra pregunta si el valor total del examen es mayor a 100
		$('.valor').each(function (i, el) {
			valorTotal += parseInt($(el).val());
		});
		if (valorTotal > puntuacion) {
			toastr.warning('El valor de las preguntas han excedido la puntuación total de la evaluación.');
			return;
		}

		// sumarle 1 a c
		c += 1;

		// Añadir la pregunta nueva
		$('#preguntasAdicionales').append(`
			<div class="card my-4 ">
				<div class="card-header py-2 grey lighten-3">
					<h4 class="mb-3">Pregunta #${c}</h4>
				</div>
				<div class="card-body contenedor">
					<div class="form-row mt-4">
						<div class="col-md-3 col-sm-6">
							<label>Tipo de pregunta</label>
							<select name="tipo_pregunta-${c}" class="tipo_pregunta browser-default custom-select campo" required>
								<option value="Verdadero_o_Falso">Verdadero o Falso</option>
								<option value="Seleccion_Simple">Seleccion simple</option>
								<option value="Desarrollo">Desarrollo</option>
							</select>
						</div>
						<div class="col-md-3 col-sm-6">
							<label>Pregunta</label>
							<input type="text" class="form-control campo" name="preg-${c}" required>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="resp">
								<label>Respuesta</label>
								<select name="resp-${c}" class="browser-default custom-select campo" required>
									<option value="verdadero">Verdadero</option>
									<option value="falso">Falso</option>
								</select>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<label>Valor pregunta</label>
							<input type="number" name="valor-${c}" class="valor form-control campo" max="100" min="1" required>
						</div>
					</div>
					<div class="respinco"></div>
				</div>
			</div>
		`);
		tipo_pregunta(c);
	});

	// ELIMINAR ULTIMA PREGUNTA AÑADIDA
	$('#delPregunta').click(() => {
		$('#preguntasAdicionales').children().last().remove();
		c -= 1;
	});

	// ENviar formulario con las preugntas al servidor
	$('#questionForm').submit(function (e) {

		e.preventDefault();

		let puntuacion = $('#puntuacion').val(), valorTotal = 0;

		// Validar que no se pueda introducir otra pregunta si el valor total del examen es mayor a 100
		$('.valor').each(function (i, el) {
			valorTotal += parseInt($(el).val());
		});
		if (valorTotal > puntuacion) {
			toastr.warning('El valor de las preguntas han excedido la puntuación total de la evaluación.');
			e.preventDefault();
			return;
		}
		else if (valorTotal < puntuacion) {
			toastr.warning('El valor de las preguntas no han alcanzado la puntuación total de la evaluación.');
			e.preventDefault();
			return;
		}

		e.target.submit();

	});


	// ---------------------- AÑADIR CONTENIDO --------------------------------------

	$('#addContent').submit((e) => {
		e.preventDefault();

		// 1. Preguntamos antes de proceder
		if (confirm("¿Estás seguro de que deseas guardar este contenido?")) {

			let data = {
				lapso: $('#lapso').val(),
				tema: $('#tema').val(),
				contenido: EDITOR.getData()
			}

			$.post(`${base_url}addContent`, data, (d) => {
				// 2. Mostramos el mensaje de éxito
				toastr.success('Contenido añadido correctamente');

				// Limpiamos los campos (opcional, ya que vamos a recargar)
				$('#lapso').val('');
				$('#tema').val('');
				EDITOR.setData('');

				// 3. Recargamos la página después de 1 segundo para que el usuario vea el mensaje
				setTimeout(() => {
					location.reload();
				}, 1000);
			})
				.fail((err) => {
					console.log(err);
					toastr.error(err.statusText);
				});
		}
	});







	// ----------------------- AÑADIR ARCHIVOS ---------------------------------------

	// añade la lingitud de l¿osarchivos subidos a un input hidden en el formulario
	$('#archivo').change(function (e) {

		let length = $('#archivo')[0].files.length;
		$('.length').val(length);
	});


	// ------------------------ ACTUALIZAR PERFIL -----------------------------

	// quitar el attr readonly que por defecto tienen los campos para editar la info de usuario presionando un boton
	$('#editar').click(() => {
		$('.edt').each((i, el) => {
			$(el).removeAttr('readonly');
		});
		// $('#actualizarbtn').removeAttr('disabled')
	});
	$('#editPass').click(function () {

		if ($(this).text() == 'MEJOR NO') {
			$(this).text('cambiar');
			$('.editPass').attr('disabled', 'true');
			$('.editPass').val('');
			$('#texto').text('');
			$('#actualizarbtn').removeAttr('disabled');
		}
		else {
			$(this).text('MEJOR NO');
			$('.editPass').removeAttr('disabled');
		}
	});

	$('#claverep').keyup(() => {

		let claveVal = $('#clave').val();
		let claverepVal = $('#claverep').val();

		if (claverepVal == claveVal) {
			$('#actualizarbtn').removeAttr('disabled');
			$('#texto').text('');
		}
		else {
			$('#texto').text('Las contraseñas no coinciden');
			$('#actualizarbtn').attr('disabled', 'true');
		}
	});

	// validadcion para que el form no se envie sin antes habilitar los campos de dicho form
	$('#perfilForm').submit((e) => {
		e.preventDefault();

		if ($('#nombre').attr('readonly')) {
			toastr.error('Habilite los campos del formulario primero');
		}
		else {
			e.target.submit();
		}

	});

	// mostrar preview de la imagen de usuario a subir
	$('#chavatar').change((e) => {
		$('#sendBtn').removeClass('d-none');

		// imagen de preview
		let file = e.target.files[0];
		let reader = new FileReader();

		reader.onload = (ev) => {
			$('#avatar').attr('src', ev.target.result);
		}

		reader.readAsDataURL(file);
	});



	// ---------------- EXAMEN ESTUDIANTE ------------------------

	// Asignarle el tema_id del examen a un input hidden en el modal
	$('.triggerGoToTest').click(function (e) {
		$('#examid').attr('href', `${base_url}estudiante/evaluacion/${$(this).data('ideval')}`);
	});

	// poner el tiempo de la prueba en el modal de entrada de la misma
	$('.cardeval').click(function (e) {
		$('#tiempo').text($(this).find('.time').text());
	});


	function sendTestAjaxRequest() {
		$.post(`${base_url}sendtest`, $('#formtest').serialize(), (d) => {
			console.log(d);
			$('#puntuacion').removeClass('d-none');
			$('#puntuacionModal').modal();

			for (let examen of d.examen) {
				$('#respuestas').append(`
					<p>
						<b>Pregunta:</b> ${examen.pregunta}<br>
						<b>Respuesta:</b> ${examen.respuesta}
					</p>
				`);
			}

			$('#calif').text(d.puntuacion + ' puntos');

			if (d.puntuacion > 59) {
				// sumarle 1 a el campo aprobado
				$.post(`${base_url}add_aprobado`, { idexamen: $('#idexamen').val() }, (d) => {
					console.log('Aprobado ' + d);
				})
					.fail((e) => {
						console.log(e.responseText);
						toastr.error('Ha ocurido un error sumandole un aprobado al examen');
					});
			}
			else {
				$.post(`${base_url}add_reprobado`, { idexamen: $('#idexamen').val() }, (d) => {
					console.log('Reprobado ' + d);
				})
					.fail((e) => {
						console.log(e.responseText);
						toastr.error('Ha ocurido un error sumandole un reprobado al examen');
					});
			}
		})
			.fail((er) => {
				console.log(er.responseText);
				toastr.error(er.statusText);
			});
	}

	// temporizador de la evaluacion
	if (/estudiante\/evaluacion\/[0-9]+$/.test(pathname)) {

		if ($('#formtest').length > 0) {

			// sumarle 1 a el campo vistas
			$.post(`${base_url}add_visto`, { idexamen: $('#idexamen').val() }, (d) => {
				console.log(d);
			})
				.fail((e) => {
					console.log(e.responseText);
					toastr.error('Ha ocurido un error sumandole una vista al examen');
				});


			// TEMPORIZADOR
			if (sessionStorage.getItem('temporizador')) {
				$('#temp').text(sessionStorage.getItem('temporizador'));
			}
			else {
				sessionStorage.setItem('temporizador', $('#temp').text());
			}

			let interval = setInterval(() => {

				let tiempoLimite = sessionStorage.getItem('temporizador');
				let temp = moment(tiempoLimite, 'HH:mm:ss').subtract(1, 'seconds').format('HH:mm:ss');

				sessionStorage.setItem('temporizador', temp);
				$('#temp').text(temp);

				if (temp == '00:00:10') {
					$('#temp').css('color', 'red');
					$('#temp').parent().addClass('animated shake');
				}

				if (temp == '00:00:00') {
					clearInterval(interval);
					sessionStorage.removeItem('temporizador');

					sendTestAjaxRequest();

					toastr.info('Prueba terminada');
					$('#terminar').attr('disabled', true);
					$('input').attr('disabled', true);
				}

			}, 1000);

			$('#formtest').submit((e) => {
				e.preventDefault();
				sessionStorage.removeItem('temporizador');
				sendTestAjaxRequest();
				clearInterval(interval);
				toastr.info('Prueba terminada');
				$('#terminar').attr('disabled', true);
				$('input').attr('disabled', true);
			});
		}

	}

	// enviar a un input hidden el id de la asignacino_usuario presionando el boton del modal para enviar la respuesta de la asignaicon
	$('#asigUserIdBtn').click(() => {
		let asig_user_id = $('#asig_user_id').data('asignacion_usuario');
		let asignacion_id = $('#asignacion_id').data('asignacion_id');

		$('#asignacion_usuario_id').val(asig_user_id);
		$('#asignacionid').val(asignacion_id);
	});

	// enviar a un input hidden el id de la respuesta_asignacion presionando el boton del modal para calificar la despuesta de la asignaicon de un estudiante
	$('#calificar_btn').click(() => {
		let id_respuesta_asignacion = $('#calificar_btn').data('id_respuesta_asignacion');

		$('#id_respuesta_asignacion').val(id_respuesta_asignacion);
	});


	// Funcones del chat

	// enviar el mensaje a la bd
	$('#chatForm').submit((e) => {
		e.preventDefault();

		let data = {
			mensaje: $('#comentario').val(),
			usuarioid: $('#usuarioid').val(),
			seccionid: $('#seccionid').val()
		}

		$.post(`${base_url}mensajear`, data, (data) => {

			$('#comentario').val('');

			let altura = $('#chat').prop('scrollHeight');
			$('#chat').scrollTop(altura);

		})
			.fail((e) => {
				console.log(e.responseText);
				toastr.error(e.statusText);
			});
	});

	// mostrar los mensajes cada segundo y actualizar la bandeja
	if (pathname.endsWith('chat')) {

		let seccion = $('#seccion').val();
		let usuarioid = $('#usuarioid').val();

		let altura = $('#chat').prop('scrollHeight');
		$('#chat').scrollTop(altura);

		let interval = setInterval(() => {

			$.get(`${base_url}traer_mensajes/${seccion}/${usuarioid}`, (data) => {

				if (data.length > 0) {

					$('#chat').html(data);

				}
				else {
					$('#chat').html('<h2 class="pt-5 text-center">No hay una conversación registrada.</h2>');
				}

			})
				.fail((e) => {
					console.log(e.responseText);
					toastr.error(e.statusText);
				});

		}, 1000);
	}
	// end funcinoes del chat


	$('.delInitialContent').click(function () {
		let idcontenido = $(this).data('idcontenido');

		$('#idcontenidoinicial').val(idcontenido);
	});

	// borrar asignacino
	$('.borrarAsig').click(function () {
		let idasignacion = $(this).data('idasignacion');

		$('#idasignacion').val(idasignacion);
	});

	$(document).ready(function () {

		// ==========================================
		// 1. CONTROL DEL MODAL: ELIMINAR HERRAMIENTA
		// ==========================================
		$('.borrarHerr').click(function (e) {
			// Detener la redirección del enlace <a> padre
			e.preventDefault();
			e.stopPropagation();

			// Capturar el ID asignado en el botón
			let idherramienta = $(this).data('idherramienta');

			// Inyectar valores para depuración y envío de formulario
			$('#idherramienta').val(idherramienta);
			$('#debug-id').text(idherramienta);

			// Abrir el modal manualmente
			$('#borrarherramienta').modal('show');
		});

		// ==========================================
		// 2. CONTROL DEL MODAL: AGREGAR HERRAMIENTA
		// ==========================================
		// Escucha el clic en el botón que tenga el título o clase de agregar
		$('button[title="Agragar herramienta"]').click(function (e) {
			e.preventDefault();

			// Abre el modal de agregar (asegúrate de que su ID sea 'modal')
			$('#modal').modal('show');
		});

		// ==========================================
		// CONTROL DEL MODAL: EDITAR CONTENIDO INICIAL
		// ==========================================
		$('.editInitialContent').click(function (e) {
			e.preventDefault();

			// Obtener los datos del elemento cliqueado
			let id = $(this).data('id');
			let titulo = $(this).data('titulo');
			let contenido = $(this).data('contenido');

			// Asignar los valores a los campos del modal de edición
			$('#edit_idcontenido').val(id);
			$('#edit_titulo').val(titulo);
			$('#edit_contenido').val(contenido);

			// Limpiar el campo file del modal por si acaso quedó basura de una acción previa
			$('#edit_image').val('');
			$('#edit_image').next('.custom-file-label').html('Selecciona una nueva imagen (Opcional)');

			// Desplegar el modal de edición
			$('#editContenidoModal').modal('show');
		});

	});

	// 1. DECLARACIÓN GLOBAL (Al inicio de tu app.js o fuera de los eventos)
	// Esto evita que salte el error de "is not defined"
	if (typeof editEditorInstance === 'undefined') {
		var editEditorInstance = null;
	}

	$(document).ready(function () {

		// ==========================================
		// A. ABRIR MODAL Y LLENAR DATOS
		// ==========================================
		$(document).on('click', '.editarAsig', function (e) {
			e.preventDefault();

			// 1. Capturamos los datos del botón y del DOM
			let idasignacion = $(this).data('idasignacion');
			let nombre = $(this).data('nombre');
			// Capturamos el HTML de la descripción directamente del párrafo de la tarjeta
			let descripcion = $(this).closest('.card-body').find('p[style="color: #454545"]').html();

			// 2. Llenamos los inputs básicos
			$('#edit_idasignacion').val(idasignacion);
			$('#edit_nombre').val(nombre);

			// 3. Llenamos el CKEditor
			if (typeof EDITOR_EDIT_ASIGNACION !== 'undefined' && EDITOR_EDIT_ASIGNACION !== null) {
				EDITOR_EDIT_ASIGNACION.setData(descripcion);
			} else {
				$('#edit_editor_asignacion').val(descripcion);
			}

			// Nota sobre MDB-Select: Como en tu vista principal solo imprimes los NOMBRES 
			// de los estudiantes, JS no sabe cuáles son sus IDs para marcarlos en el select.
			// Por ahora lo dejaremos en blanco para que el profe los vuelva a seleccionar, 
			// o tendrías que hacer un $.get() a tu base de datos para traer esos IDs.
			$('#edit_usuario').val([]);

			// 4. Abrimos el modal
			$('#editasignacion').modal('show');
		});


		// ==========================================
		// B. ENVIAR EL FORMULARIO POR AJAX 
		// ==========================================
		$('#editAsignacionForm').submit(function (e) {
			e.preventDefault();

			// Sincronizar el contenido del CKEditor con el textarea antes de enviar
			if (typeof EDITOR_EDIT_ASIGNACION !== 'undefined' && EDITOR_EDIT_ASIGNACION !== null) {
				$('#edit_editor_asignacion').val(EDITOR_EDIT_ASIGNACION.getData());
			}

			// Validar que se haya seleccionado al menos un estudiante
			if ($('#edit_usuario').val().length === 0) {
				toastr.warning('Debes seleccionar al menos un estudiante.');
				return;
			}

			let formData = $(this).serialize();

			$.post(`${base_url}editarasignacion`, formData, (response) => {
				// Asumiendo que tu controlador devuelve un éxito
				toastr.success('Asignación actualizada correctamente');

				// Cerramos el modal y recargamos para ver los cambios
				$('#editasignacion').modal('hide');
				setTimeout(() => {
					location.reload();
				}, 1500);
			})
				.fail((er) => {
					console.error("Error:", er.responseText);
					toastr.error('Ocurrió un error al actualizar la asignación.');
				});
		});

		// Recalcular el ancho del mdb-select cuando el modal de asignación se abre
		$('#addasignacion').on('shown.bs.modal', function () {
			// Destruimos la inicialización previa que falló por estar oculta
			$('.mdb-select').materialSelect({
				destroy: true
			});
			// Volvemos a inicializarla ahora que el modal es visible
			$('.mdb-select').materialSelect();
		});

		// Inicializar CKEditor clásico para el modal de edición si existe en la página
		if (typeof ClassicEditor !== 'undefined' && document.querySelector('.editor_edit')) {
			ClassicEditor.create(document.querySelector('.editor_edit'))
				.then(editor => {
					editEditorInstance = editor;
				})
				.catch(error => {
					console.error("Error al inicializar CKEditor de edición:", error);
				});
		}

		// 2. EVENTO CLIC EN EDITAR (Copiando la lógica ganadora del botón "Ver")
		$(document).on('click', '.editar_contenido', function (e) {
			e.preventDefault();

			let idtema = $(this).data('idtema');
			let lapso = $(this).data('lapso');
			let tema = $(this).data('tema');

			// Sincronizar inputs básicos del modal de inmediato
			$('#edit_idtema').val(idtema);
			$('#edit_lapso').val(lapso);
			$('#edit_tema').val(tema);

			// Controlamos si la instancia del editor existe de forma segura antes de limpiar
			if (typeof editEditorInstance !== 'undefined' && editEditorInstance !== null) {
				editEditorInstance.setData('');
			} else {
				$('#edit_contenido_editor').val('');
			}

			let info = { idtema: idtema };

			// Usamos la misma ruta limpia del botón "Ver" que ya comprobamos que funciona
			$.post(`${base_url}traer_contenido`, info, (contenido) => {

				let contenidoHtml = '';
				if (Array.isArray(contenido) && contenido.length > 0) {
					contenidoHtml = contenido[0].contenido;
				} else if (contenido && contenido.contenido) {
					contenidoHtml = contenido.contenido;
				}

				// Inyectar el HTML de manera segura en el CKEditor o el Textarea común
				if (typeof editEditorInstance !== 'undefined' && editEditorInstance !== null) {
					editEditorInstance.setData(contenidoHtml);
				} else {
					$('#edit_contenido_editor').val(contenidoHtml);
				}

				// ABRIR EL MODAL (Ahora sí se ejecutará de forma limpia)
				$('#editContentModal').modal('show');
			})
				.fail((er) => {
					console.log(er.responseText);
					alert('Error al obtener los detalles del contenido.');
				});
		});

		// 3. ENVÍO DEL FORMULARIO EDITADO
		// Envío del formulario editado usando tu ruta alias directa
		$('#editContentForm').submit(function (e) {
			e.preventDefault();

			// Sincronizar los datos del CKEditor al textarea antes de mandar el POST
			if (typeof editEditorInstance !== 'undefined' && editEditorInstance !== null) {
				$('#edit_contenido_editor').val(editEditorInstance.getData());
			}

			// Apuntamos directo al alias de tu archivo de rutas
			$.post(`${base_url}editarcontenido`, $(this).serialize(), (response) => {

				// Como tu controlador devuelve un echo json_encode(...)
				// Intentamos leer la respuesta de forma segura
				let res = typeof response === 'string' ? JSON.parse(response) : response;

				if (res && res.status === 'success') {
					alert('Contenido actualizado correctamente');
					location.reload();
				} else if (res && res.message) {
					alert('Error: ' + res.message);
				} else {
					// Por si acaso pasa el filtro pero no viene con el formato estricto
					alert('Contenido actualizado correctamente');
					location.reload();
				}
			})
				.fail((er) => {
					console.error("Error en el servidor:", er.responseText);
					alert('Error al actualizar el contenido.');
				});
		});
	});

});