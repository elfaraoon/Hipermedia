<?php defined('BASEPATH') or exit('No direct script access allowed');

class ContenidoController extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('common/Contenido');
		$this->load->model('common/Usuario');
	}

	public function upload_image()
	{
		// Carpeta de destino
		$config['upload_path']   = './uploads/imagenes/';
		$config['allowed_types'] = 'gif|jpg|png|jpeg';
		$config['encrypt_name']  = TRUE;

		if (!is_dir($config['upload_path'])) {
			mkdir($config['upload_path'], 0777, TRUE);
		}

		$this->load->library('upload', $config);

		if (!$this->upload->do_upload('upload')) {
			// Respuesta en caso de error
			echo json_encode([
				'uploaded' => 0,
				'error' => ['message' => $this->upload->display_errors('', '')]
			]);
		} else {
			$data = $this->upload->data();
			// Respuesta en caso de éxito
			echo json_encode([
				'uploaded' => 1,
				'fileName' => $data['file_name'],
				'url' => base_url('uploads/imagenes/' . $data['file_name'])
			]);
		}
	}
	public function mostrar_contenido($idtema)
	{
		if ($this->session->has_userdata('email')) {

			$data['contenido'] = $this->Contenido->get_content($idtema);
			$data['userTipo']  = $this->session->userdata('tipo');

			$correo 	     = $this->session->userdata()['email'];
			$user['seccion'] = $this->session->userdata()['seccion'];
			$user['user']    = $this->Usuario->traer_usuario($correo);
			$user['cantMsg'] = chat_notification($user['user'][0]->idusuario)[0]->contador;

			if ($this->session->userdata('tipo') == 'Docente') {
				$this->load->view('common/header', ['title' => 'Docente', 'page' => 'Contenidos']);
				$this->load->view('k/partials/sidenav-teacher', $user);
				$this->load->view('k/teacher/contenidoview', $data);
				$this->load->view('common/footer');
			} else {
				$this->load->view('common/header', ['title' => 'Estudiante', 'page' => 'Contenidos']);
				$this->load->view('k/partials/sidenav-student', $user);
				$this->load->view('k/teacher/contenidoview', $data);
				$this->load->view('common/footer');
			}
		} else {
			redirect('');
		}
	}

	public function agregar_contenido()
	{
		$tema  	   = $this->input->post('tema');
		$lapso     = $this->input->post('lapso');
		$contenido = $this->input->post('contenido');
		$seccionid = $this->session->userdata()['seccionid'];

		// $res = $this->Contenido->verificar_lapso($lapso, $seccionid);

		// if ($res) {
		// 	return $this->output
		// 		->set_content_type('application/json')
		// 		->set_output(json_encode( true ));
		// }
		// -----------------------------------------------------------------

		$datac['contenido']  = $contenido;
		// $datac['seccion_id'] = $seccionid;
		$datac['created_at'] = date('Y-m-d H:i:s');

		$datat['lapso']      = $lapso;
		$datat['tema']       = $tema;
		$datat['seccion_id'] = $seccionid;
		$datat['created_at'] = date('Y-m-d H:i:s');

		$this->Contenido->crear_contenido($datac, $datat);
	}

	public function traer_temas()
	{
		$lapso   = $this->input->post('lapso');
		$seccion = $this->input->post('seccion');

		return $this->output
			->set_content_type('application/json')
			->set_output(json_encode($this->Contenido->traer_temas($lapso, $seccion)));
	}

	public function traer_contenido()
	{
		// Si la sesión expiró, devolvemos un error JSON en lugar de redireccionar a un HTML
		if (!$this->session->has_userdata('email')) {
			return $this->output
				->set_status_header(401) // Estado 401: No autorizado
				->set_content_type('application/json')
				->set_output(json_encode(['status' => 'session_expired', 'message' => 'La sesión ha expirado']));
		}

		$idtema = $this->input->post('idtema');

		return $this->output
			->set_content_type('application/json')
			->set_output(json_encode($this->Contenido->traer_contenido($idtema)));
	}

	public function delTemaContenido()
	{
		if ($this->session->userdata('tipo') == 'Estudiante') {
			jsondie('nop');
		} else {

			$idtema = $this->input->post('idtema');

			$this->Contenido->eliminarTema($idtema);

			jsondie('Tema eliminado correctamente');
		}
	}

	public function editar_contenido()
	{
		if (!$this->session->has_userdata('email')) {
			return $this->output
				->set_status_header(401)
				->set_content_type('application/json')
				->set_output(json_encode(['status' => 'session_expired', 'message' => 'La sesión ha expirado']));
		}

		if ($this->session->userdata('tipo') == 'Estudiante') {
			echo json_encode(['status' => 'error', 'message' => 'Acceso denegado']);
			return;
		} else {
			$idtema    = $this->input->post('idtema');
			$tema      = $this->input->post('tema');
			$lapso     = $this->input->post('lapso');
			$contenido = $this->input->post('contenido');

			$datac['contenido'] = $contenido;
			$datat['lapso']     = $lapso;
			$datat['tema']      = $tema;

			$this->Contenido->actualizar_contenido($idtema, $datac, $datat);

			echo json_encode(['status' => 'success', 'message' => 'Tema y contenido modificados con éxito']);
		}
	}
}
