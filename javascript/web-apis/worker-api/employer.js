var w;

function startWorker() {
  if (typeof(Worker) !== "undefined") {
    if (typeof(w) == "undefined") {
      w = new Worker("demo_workers.js");
    }
    w.onmessage = function(event) {
      event.data;
    };
  } else {
    "No Web Worker support.";
  }
}

function stopWorker() {
  w.terminate();
  w = undefined;
}
