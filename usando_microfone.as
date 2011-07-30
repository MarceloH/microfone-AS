var useEchoSuppression_ch:mx.controls.CheckBox;
var activityLevel_pb:mx.controls.ProgressBar;

//Crio meu clip responsavel pelo som
this.createEmptyMovieClip("sound_mc", this.getNextHighestDepth());
//Crio a recepção do microfone
var microfone:Microphone = Microphone.get();
//adiciono o microfone ao palco
sound_mc.attachAudio(microfone);
//Habilito a supressão de ECO
sound_mc.useEchoSuppression = true;

//Do o valor e a label para o progress bar que é responsavel pelo volume do microfone
gain_pb.label = "Ganho: %3";
gain_pb.mode = "manual";
gain_pb.setProgress(microfone.gain, 100);
//Dou a label e o mode do progress bar que é responsavel por verificar a atividade do microfone
atividade_pb.mode = "manual";
atividade_pb.label = "Nivel Level: %3";

//Seto os valores do numeric stepper para 100
gain_nstep.maximum = 100;
//Digo que o valor do numeric stepper é o do microfone
gain_nstep.value = microfone.gain;
//Botão do echo Supression(Supressão de Eco do Microfone
echo_ch.selected  = active_mic.useEchoSuppression;

//Função que mostra o ganho do microfone
function changeGain() {
microfone.setGain(gain_nstep.value);
gain_pb.setProgress(microfone.gain, 100);
}
gain_nstep.addEventListener("change", changeGain);

this.onEnterFrame = function() {
atividade_pb.setProgress(microfone.activityLevel, 100);
};

//Função de mostragem da recepção do microfone
var chListener:Object = new Object();
chListener.click = function(evt:Object) {
microfone.setUseEchoSuppression(evt.target.selected);
};
echo_ch.addEventListener("click", chListener);