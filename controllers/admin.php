<?php

class Admin extends Controller {

    function index() {
        
        $username = $_SESSION['username'];
        $user_category = $_SESSION['usercategory'];
        
        if (!isset($username) and !isset($user_category)){
            header("Location:" . PATH_URL . 'login');
        }
        
        if ($user_category != 'admin') {
            header("Location:" . PATH_URL . 'teste');
        }     
        
        
        
        $data = array();
        
        $this->document->setTitle('Admin');
        $this->loader->Load('head');

        $this->breadcrumbs->setBreadcrumbs('Administrador', 'admin');
        $breadcrumbs = $this->breadcrumbs->getBreadcrumbs();

        $username = $_SESSION['username'];
        
        
        $destroy = PATH_URL . 'sessions/destroy';

        $data['filename'] = 'views/admin/admin.tpl';
        if (file_exists($data['filename'])) {
            require_once 'views/admin/admin.tpl';
        }


        $this->loader->Load('footer');
    }

}