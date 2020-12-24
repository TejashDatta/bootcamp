var worker;

function startWorker() {
  if (typeof(Worker) !== "undefined") {
    if (typeof(worker) == "undefined") {
      worker = new Worker("demo_workers.js");
    }
    worker.onmessage = function(event) {
      event.data;
    };
  } else {
    "No Web Worker support.";
  }
}

function stopWorker() {
  worker.terminate();
  worker = undefined;
}
