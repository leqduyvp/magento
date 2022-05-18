<?php 
namespace Weather\CustomWidget\Block\Widget;

use Magento\Framework\View\Element\Template;
use Magento\Widget\Block\BlockInterface; 

class WeatherToday extends Template implements BlockInterface {
    protected $_template = "widget/WeatherToday.phtml";
}