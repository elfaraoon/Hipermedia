<div class="bglogin animated fadeIn">
	<?php
	header("Referrer-Policy: no-referrer-when-downgrade");
	?>
	<div class="container d-flex align-items-center justify-content-center py-5" style="min-height: 100vh; position: relative; z-index: 2;">
		<div class="card p-3 shadow-lg" style="max-width: 420px; width: 100%; border: 1px solid rgba(255, 255, 255, 0.1) !important; background: rgba(255, 255, 255, 0.95) !important; backdrop-filter: blur(10px); -webkit-backdrop-filter: blur(10px); border-radius: 20px !important;">
			<div class="card-body px-3">

				<!-- Logo/Escudo de la Universidad -->
				<?php $this->load->view('common/escudo_svg'); ?>
				<div class="text-center mb-2 mt-1">
					<h6 class="font-weight-bold text-muted small text-uppercase tracking-wider mb-2" style="font-size: 0.7rem; letter-spacing: 0.08em; line-height: 1.4; color: #64748b !important;">Universidad Nacional Experimental<br>Rómulo Gallegos</h6>
					<h3 class="font-weight-bold text-primary mb-0 mt-3" style="font-size: 1.8rem; letter-spacing: 0.05em; font-weight: 800; background: linear-gradient(135deg, #2563eb, #3b82f6); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">HIPERMEDIA</h3>
				</div>

				<form id="loginform" class="text-center mt-3">

					<h5 class="mb-4 font-weight-bold text-dark" style="font-size: 1.05rem; letter-spacing: -0.01em;">Ingreso al Aula Virtual</h5>

					<!-- Email -->
					<div class="form-group text-left mb-4">
						<label class="small font-weight-bold text-muted mb-1" for="email">Correo Electrónico</label>
						<input type="email" placeholder="ejemplo@universidad.edu" name="correo" class="form-control form-control-lg" id="email" required autofocus>
					</div>

					<!-- Password -->
					<div class="form-group text-left mb-3">
						<label class="small font-weight-bold text-muted mb-1" for="password">Contraseña</label>
						<input type="password" placeholder="••••••••" name="clave" class="form-control form-control-lg" id="password" required>
					</div>

					<p class="text-right mt-2 mb-4">
						<!-- Forgot password -->
						<a href="#modalEnviarCorreo" data-toggle="modal" class="small font-weight-bold text-primary">¿Olvidó su contraseña?</a>
					</p>

					<!-- Sign in button -->
					<button class="btn btn-primary btn-lg btn-block mb-4 py-3" type="submit">
						<i class="fas fa-sign-in-alt mr-2"></i>Entrar a la plataforma
					</button>

					<!-- Register -->
					<p class="text-muted small mb-0">¿No eres miembro? 
						<a href="#registro" data-toggle="modal" class="font-weight-bold text-primary">Regístrate</a>
					</p>
				</form>
			</div>
		</div>
	</div>

</div>



<!-- Modal de registro -->

<!-- Central Modal Small -->
<div class="modal fade" id="registro">

	<div class="modal-dialog modal-lg" role="document">

		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title w-100">Registro del profesor</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="registerform">

				<div class="modal-body p-4">

					<div class="row">
						<div class="col">

							<div class="form-row mb-4">
								<div class="col-2 text-right">
									<label for="cedula">Cédula</label>
								</div>
								<div class="col">
									<input type="text" id="cedula" name="cedula" class="cedula form-control-lg form-control" required minlength="8" maxlength="9" pattern="^[0-9]{8,9}$">
									<p class="small red-text cimsg"></p>
								</div>
							</div>

							<div class="form-row mb-4">
								<div class="col-2 text-right">
									<label for="nombre">Nombre</label>
								</div>
								<div class="col">
									<input type="text" id="nombre" name="nombre" class="form-control form-control-lg validate" required pattern="^([a-zA-Z][\s]?)+$">
								</div>
							</div>

							<div class="form-row mb-4">
								<div class="col-2 text-right">
									<label for="apellido">Apellido</label>
								</div>
								<div class="col">
									<input type="text" id="apellido" name="apellido" class="form-control form-control-lg" required pattern="^([a-zA-Z][\s]?)+$">
								</div>
							</div>
						</div>
						<div class="col">
							<div class="form-row mb-4">

								<div class="col-2">
									<label for="correo">E-mail</label>
								</div>
								<div class="col">
									<input type="email" id="correo" name="correo" class="correo form-control form-control-lg validate" required>
									<p class="small red-text cemsg"></p>
								</div>
							</div>

							<div class="form-row mb-4">

								<div class="col-2">
									<label for="telefono">Teléfono</label>
								</div>
								<div class="col">
									<input type="text" id="telefono" name="telefono" class="form-control form-control-lg validate" placeholder="xxxx-xxx-xxxx" pattern="^[0-9]{4}-[0-9]{3}-[0-9]{4}$">
								</div>
							</div>

							<div class="form-row mb-4">

								<div class="col-2">
									<label for="seccion">Sección</label>
								</div>
								<div class="col">
									<input type="number" id="seccion" name="seccion" class="form-control form-control-lg">
								</div>
							</div>

						</div>
					</div>

					<div class="form-row">
						<div class="col">
							<label for="clave">Contraseña</label>
							<input type="password" id="clave" name="clave" class="form-control form-control-lg" required>
						</div>

						<div class="col">
							<label for="clave">Confirma contraseña</label>
							<input type="password" id="clave" class="form-control form-control-lg" required>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="submit" id="registerbtn" class="btn-md btn btn-primary"><i class="fas fa-save mr-2"></i>Registrarme</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Central Modal Small -->


<div class="modal fade" id="modalEnviarCorreo">

	<div class="modal-dialog modal-sm" role="document">

		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title w-100">Recuperar contraseña</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="recuperar_contrasena">

				<div class="modal-body">

					<div class="form-row">
						<div class="col">
							<label for="sendCorreo">Correo Electrónico</label>
							<input type="email" id="sendCorreo" name="correo" class="form-control validate" required>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary btn-md"><i class="fas fa-paper-plane mr-2"></i>Enviar</button>
				</div>
			</form>
		</div>
	</div>
</div>