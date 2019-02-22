// import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2();
  $('.select2size').select2({placeholder: 'Size'});
};

export { initSelect2 };
