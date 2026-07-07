<?php if ($this->session->has_userdata('tipo')): ?>
    <?php
    $seg1 = $this->uri->segment(1);
    $seg2 = $this->uri->segment(2);
    $current_page = $seg1 . ($seg2 ? '/' . $seg2 : '');
    $tipo = $this->session->userdata('tipo');
    ?>
    <div class="mobile-bottom-nav d-lg-none">
        <?php if ($tipo === 'Estudiante'): ?>
            <a href="<?= site_url('estudiante') ?>" class="mobile-bottom-nav-item <?= ($current_page === 'estudiante' || $current_page === 'estudiante/index') ? 'active' : '' ?>">
                <i class="fas fa-home"></i>
                <span>Inicio</span>
            </a>
            <a href="<?= site_url('estudiante/contenidos') ?>" class="mobile-bottom-nav-item <?= ($current_page === 'estudiante/contenidos') ? 'active' : '' ?>">
                <i class="fas fa-book"></i>
                <span>Contenido</span>
            </a>
            <a href="<?= site_url('estudiante/evaluaciones') ?>" class="mobile-bottom-nav-item <?= ($current_page === 'estudiante/evaluaciones') ? 'active' : '' ?>">
                <i class="fas fa-tasks"></i>
                <span>Exámenes</span>
            </a>
            <a href="<?= site_url('estudiante/asignaciones') ?>" class="mobile-bottom-nav-item <?= ($current_page === 'estudiante/asignaciones') ? 'active' : '' ?>">
                <i class="fas fa-calendar-check"></i>
                <span>Tareas</span>
            </a>
            <a href="<?= site_url('perfil') ?>" class="mobile-bottom-nav-item <?= ($current_page === 'perfil') ? 'active' : '' ?>">
                <i class="fas fa-user-circle"></i>
                <span>Perfil</span>
            </a>
        <?php elseif ($tipo === 'Docente'): ?>
            <a href="<?= site_url('docente') ?>" class="mobile-bottom-nav-item <?= ($current_page === 'docente' || $current_page === 'docente/index') ? 'active' : '' ?>">
                <i class="fas fa-home"></i>
                <span>Inicio</span>
            </a>
            <a href="<?= site_url('docente/contenidos') ?>" class="mobile-bottom-nav-item <?= ($current_page === 'docente/contenidos') ? 'active' : '' ?>">
                <i class="fas fa-book"></i>
                <span>Contenido</span>
            </a>
            <a href="<?= site_url('docente/estudiantes') ?>" class="mobile-bottom-nav-item <?= ($current_page === 'docente/estudiantes') ? 'active' : '' ?>">
                <i class="fas fa-users"></i>
                <span>Alumnos</span>
            </a>
            <a href="<?= site_url('docente/evaluaciones') ?>" class="mobile-bottom-nav-item <?= ($current_page === 'docente/evaluaciones') ? 'active' : '' ?>">
                <i class="fas fa-tasks"></i>
                <span>Exámenes</span>
            </a>
            <a href="<?= site_url('docente/asignaciones') ?>" class="mobile-bottom-nav-item <?= ($current_page === 'docente/asignaciones') ? 'active' : '' ?>">
                <i class="fas fa-calendar-check"></i>
                <span>Tareas</span>
            </a>
        <?php endif; ?>
    </div>
<?php endif; ?>

<script src="<?= base_url('application/assets/js/libs/jquery-3.4.1.min.js') ?>"></script>
<script src="<?= base_url('application/assets/js/libs/mdb.min.js') ?>"></script>
<script src="<?= base_url('application/assets/js/libs/ckeditor.js') ?>"></script>
<script src="<?= base_url('application/assets/js/libs/moment.min.js') ?>"></script>
<script>
	var base_url = "<?= base_url() ?>";
</script>

<script src="<?= base_url('application/assets/js/app.js') ?>"></script>
</body>

</html>