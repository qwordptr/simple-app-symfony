<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class HomeController 
{
    /**
     * @Route("/")
     */
   public function hello()
   {
       $number = mt_rand(0, 100);

        return new Response(
            '<html><body>Sranie w banie.Oh yeah...Lucky number: '.$number.'</body></html>'
        );
   }
}
