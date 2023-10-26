<section id="faq" class=" my-3">
    <div class="container">
        <div class="container">
            <h2 class="title">سوالات متداول</h2>
            <div id="accordion">
                @php($i=0)
                @foreach($all_questions as $question)
                  @php($i=$i+1)
                <div class="card">
                    <div class="card-header">
                        <a class="card-link" data-toggle="collapse" href="#collapse{{$i}}">
                            <span class="fa fa-question fa-flip-horizontal"></span>
                            {{$question->q_title}}
                        </a>
                    </div>
                    <div id="collapse{{$i}}" class="collapse @if($i==1) show @endif" data-parent="#accordion">
                        <div class="card-body">
                            {{$question->q_answer}}
                        </div>
                    </div>
                </div>
                @endforeach

            </div>
        </div>

    </div>
</section>
