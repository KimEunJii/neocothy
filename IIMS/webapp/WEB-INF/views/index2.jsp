<script src="https://code.angularjs.org/1.2.9/angular.min.js"></script>
<script src="https://rawgit.com/dwmkerr/angular-modal-service/master/dst/angular-modal-service.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
	   <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<div class="container" ng-app="app" ng-controller="Controller">
     <h3>Angular Modal Service</h3>
 <a class="btn btn-default" href ng-click="show()">Show a Modal</a>

    <p>{{message}}</p>
    <!-- The actual modal template, just a bit o bootstrap -->
    <script type="text/ng-template" id="modal.html">
        < div class = "modal fade" > < div class = "modal-dialog" > < div class = "modal-content" > < div class = "modal-header" > < button type = "button"
        class = "close"
        ng - click = "close('Cancel')"
        data - dismiss = "modal"
        aria - hidden = "true" > & times; < /button>
                <h4 class="modal-title">Yes or No?</h4 > < /div>
              <div class="modal-body">
                <p>It's your call...</p > < /div>
              <div class="modal-footer">
                <button type="button" ng-click="close('No')" class="btn btn-default" data-dismiss="modal">No</button > < button type = "button"
        ng - click = "close('Yes')"
        class = "btn btn-primary"
        data - dismiss = "modal" > Yes < /button>
              </div > < /div>
          </div > < /div>
    </script>
</div>


<script>
var app = angular.module('app', ['angularModalService']);

app.controller('Controller', function($scope, ModalService) {
    
    $scope.show = function() {
        ModalService.showModal({
            templateUrl: 'modal.html',
            controller: "ModalController"
        }).then(function(modal) {
            modal.element.modal();
            modal.close.then(function(result) {
                $scope.message = "You said " + result;
            });
        });
    };
    
});

app.controller('ModalController', function($scope, close) {
  
 $scope.close = function(result) {
 	close(result, 500); // close, but give 500ms for bootstrap to animate
 };

});

  

  </script>
	
	
</body>
</html>