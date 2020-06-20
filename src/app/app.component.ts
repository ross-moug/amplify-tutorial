import { Component, OnInit } from '@angular/core';
import { APIService } from './API.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less']
})
export class AppComponent implements OnInit {
  title = 'amplify-tutorial';
  todos: any[] = [];

  constructor(private apiService: APIService) {}

  ngOnInit(): void {
    this.apiService.ListTodos().then((evt) => {
      this.todos = evt.items;
    });

    this.apiService.OnCreateTodoListener.subscribe((evt) => {
      const data = (evt as any).value.data.onCreateTodo;
      this.todos = [...this.todos, data];
    });
  }

  createTodo(): void {
    this.apiService.CreateTodo({
        name: 'Angular',
        description: 'testing'
    });
  }
}
