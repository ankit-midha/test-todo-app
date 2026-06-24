// In-memory state for todos
let todos = [];
let nextId = 1;

// DOM elements
const todoForm = document.getElementById('todo-form');
const todoInput = document.getElementById('todo-input');
const todoList = document.getElementById('todo-list');

// Add a new todo
function addTodo(text) {
    const trimmedText = text.trim();

    if (!trimmedText) {
        return; // Reject empty input
    }

    const todo = {
        id: nextId++,
        text: trimmedText,
        completed: false
    };

    todos.push(todo);
    renderTodos();
    todoInput.value = ''; // Clear input field
}

// Toggle todo completion status
function toggleComplete(id) {
    const todo = todos.find(t => t.id === id);
    if (todo) {
        todo.completed = !todo.completed;
        renderTodos();
    }
}

// Delete a todo
function deleteTodo(id) {
    todos = todos.filter(t => t.id !== id);
    renderTodos();
}

// Render todos to the DOM
function renderTodos() {
    todoList.innerHTML = '';

    todos.forEach(todo => {
        const li = document.createElement('li');
        li.className = todo.completed ? 'completed' : '';

        const textSpan = document.createElement('span');
        textSpan.className = 'todo-text';
        textSpan.textContent = todo.text;
        textSpan.onclick = () => toggleComplete(todo.id);

        const completeBtn = document.createElement('button');
        completeBtn.className = 'complete-btn';
        completeBtn.textContent = todo.completed ? 'Undo' : 'Complete';
        completeBtn.onclick = () => toggleComplete(todo.id);

        const deleteBtn = document.createElement('button');
        deleteBtn.className = 'delete-btn';
        deleteBtn.textContent = 'Delete';
        deleteBtn.onclick = () => deleteTodo(todo.id);

        li.appendChild(textSpan);
        li.appendChild(completeBtn);
        li.appendChild(deleteBtn);

        todoList.appendChild(li);
    });
}

// Event listeners
todoForm.addEventListener('submit', (e) => {
    e.preventDefault();
    addTodo(todoInput.value);
});

// Initial render
renderTodos();
