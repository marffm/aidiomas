<?php

class Sessions extends Controller {

    function index() {
        
    }

    function checkSession($name) {

        if (isset($_SESSION['username']) and isset($_SESSION['usercategory'])) {
            header("Location:" . PATH_URL . $name);
        } else {
            header("Location:" . PATH_URL . 'login');
        }
    }

    function verify() {

        $this->loader->loadModel('loginModel');
        $results = $this->loginModel->verifyUser();

        if ($results) {
            foreach ($results as $result) {
                $result;
            }          

            if ($result['nivel'] == 1) {
                $_SESSION['username'] = $result['nome'];
                $_SESSION['usercategory'] = 'admin';
                $link = 'admin';
            } else if ($result['nivel'] == 2) {
                $_SESSION['username'] = $result['nome_prof'];
                $_SESSION['usercategory'] = 'areaProfessor';
                $link = 'areaProfessor';
            } else if ($result['nivel'] == 3) {
                $_SESSION['username'] = $result['nome'];
                $_SESSION['usercategory'] = 'areaAluno';
                $_SESSION['alunocodigo'] = $result['codigo'];
                $link = 'areaAluno';
            }
        } else {
            $link = 'login/error';
        }
        //echo $_SESSION['usercategory'];
        header("Location:" . PATH_URL . $link);
    }

    function destroy() {
        session_destroy();
        header("Location:" . PATH_URL . 'home');
    }

}
