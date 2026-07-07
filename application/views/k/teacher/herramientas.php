<main class="animated fadeIn">
	<div class="container my-4">
		<div class="row">
			<div class="col">

				<div class="card opacity9">
					<div class="card-header grey lighten-5 d-flex justify-content-between">
						<h3>Herramientas usadas en clases</h3>
						<button class="btn btn-md btn-primary px-3" title="Agregar herramienta" data-toggle="modal" data-target="#modal">
							<i class="fas fa-plus mr-1"></i> Agregar
						</button>
					</div>
					<div class="card-body">

						<?php if ($this->session->flashdata('success')): ?>
							<div class="m-auto mb-3" style="width: 420px">
								<div class="alert alert-success alert-dismissible fade show" role="alert">
									<i class="fas fa-grin-beam mr-1"></i> <?= $this->session->flashdata('success') ?>
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
							</div>

						<?php elseif ($this->session->flashdata('fail')): ?>
							<div class="m-auto mb-3" style="width: 520px">
								<div class="alert alert-danger alert-dismissible fade show" role="alert">
									<i class="fas fa-frown-open mr-1"></i> <?= $this->session->flashdata('fail') ?>
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
							</div>
						<?php endif ?>

						<div class="list-group">

							<?php if (count($herramientas) > 0): ?>

								<?php foreach ($herramientas as $herramienta): ?>

									<a href="<?= $herramienta->enlace ?>" class="list-group-item list-group-item-action flex-column align-items-start" target="_blank">
										<div class="py-4">
											<div class="d-flex w-100 justify-content-between">
												<h5 class="mb-2 h5"><?= $herramienta->nombre ?></h5>

												<button data-idherramienta="<?= $herramienta->idherramienta ?>" data-toggle="modal" data-target="#borrarherramienta" class="btn btn-danger px-3 btn-sm borrarHerr">
													<i class="fas fa-trash mr-1"></i> Eliminar
												</button>
											</div>
											<p class="mb-2"><?= $herramienta->descripcion ?></p>
											<div class="view overlay zoom d-flex justify-content-center">
												<img src='<?= base_url("application/uploads/images/$herramienta->imagen") ?>' alt="Image Website" class="img-fluid img-thumbnail">
											</div>
										</div>
									</a>

								<?php endforeach ?>
							<?php else: ?>

								<h1 class="my-5 text-center font-weight-light">Aún no hay herramientas registradas.</h1>

							<?php endif ?>

						</div>

					</div>
				</div>
			</div>
		</div>
</main>

<!-- Modal BORRAR herramienta -->
<div class="modal fade" id="borrarherramienta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Eliminar Herramienta</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<?= form_open('eliminar_herramienta') ?>

			<input type="hidden" name="idherramienta" id="idherramienta" class="form-control text-center my-2" readonly style="background-color: #eee;">

			<div class="modal-body">
				<h3 class="my-3 text-center">¿Está seguro de borrar?</h3>
			</div>
			<div class="modal-footer d-flex justify-content-between">
				<button type="button" class="btn btn-md btn-secondary" data-dismiss="modal"><i class="fas fa-times mr-2"></i>No</button>
				<button type="submit" class="btn btn-md btn-primary"><i class="fas fa-check mr-2"></i>Sí</button>
			</div>
			</form>
		</div>
	</div>
</div>

<!-- Modal nueva herramienta  -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Registrar una nueva herramienta</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<?= form_open_multipart('registrar_herramienta') ?>

			<input type="hidden" name="seccionid" value="<?= $seccionid ?>">

			<div class="modal-body">

				<div class="row mb-3">
					<div class="col">
						<label for="nombre">Nombre</label>
						<input type="text" id="nombre" name="nombre" class="form-control form-control-lg" required>
					</div>
					<div class="col">
						<label for="descripcion">Descripción</label>
						<input type="text" name="descripcion" class="form-control form-control-lg" required>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col">
						<label for="descripcion">Enlace</label>
						<input type="text" name="enlace" class="form-control form-control-lg" required>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col">

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">Escoge el archivo</span>
							</div>
							<div class="custom-file">
								<input type="file" required id="archivo" name="archivo" accept=".png, .jpg, .gif, .jpeg">
								<label class="custom-file-label" for="archivo">Vista previa de la página o herramienta</label>
							</div>
						</div>

					</div>
				</div>

			</div>
			<div class="modal-footer d-flex justify-content-between">
				<button type="button" class="btn btn-secondary btn-md" data-dismiss="modal"><i class="fas fa-times mr-2"></i>Cerrar</button>
				<button type="submit" class="btn btn-primary btn-md"><i class="fas fa-save mr-2"></i>Guardar</button>
			</div>
			</form>
		</div>
	</div>
</div>
</div>