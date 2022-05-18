<?php 
namespace News\CustomWidget\Block\Widget;

use Magento\Framework\View\Element\Template;
use Magento\Widget\Block\BlockInterface; 

class News extends Template implements BlockInterface {
    protected $_template = "widget/News.phtml";
}