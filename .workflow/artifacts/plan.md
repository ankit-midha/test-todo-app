---
generated_by: agentic-workflow-trial@v1
phase: plan
jira_key: TODO-1
---

# Plan for TODO-1

## Approach

Build a minimal, dependency-free browser-based todo application using vanilla HTML, CSS, and JavaScript. The app will run by opening `index.html` directly in a browser without requiring a build process or backend server.

The implementation will use in-memory state (no localStorage) per the spec's explicit out-of-scope constraint on cross-session persistence. The UI will provide immediate visual feedback for completed items and basic input validation.

Three files will be created at the repository root:
- `index.html` - Document structure and UI elements
- `app.js` - Application logic for managing todos
- `styles.css` - Basic styling for readability and visual distinction

## Steps

### Step 1: Create HTML structure and basic UI
- Files: `index.html`
- Test mode: test-after
- Work:
  - Create semantic HTML document with proper structure
  - Add input field and button for adding todos
  - Add empty `<ul>` container for rendering todo items
  - Link to `app.js` and `styles.css` (to be created in subsequent steps)
  - Ensure valid HTML that passes `.workflow/verify.sh` checks
- Verification:
  - Run `.workflow/verify.sh` to confirm HTML is valid
  - Open `index.html` in browser to verify structure renders

### Step 2: Implement application logic
- Files: `app.js`
- Test mode: test-after
- Work:
  - Define in-memory array to store todo items (objects with id, text, completed status)
  - Implement `addTodo()` function with non-empty validation
  - Implement `toggleComplete()` function to mark items complete/incomplete
  - Implement `deleteTodo()` function to remove items
  - Implement `renderTodos()` function to update DOM from state
  - Wire up event listeners (form submit, Enter key, click handlers for complete/delete)
  - Handle edge cases (empty input, rapid clicks)
- Verification:
  - Run `.workflow/verify.sh` to confirm JavaScript syntax is valid
  - Open `index.html` in browser and test all three operations (add, complete, delete)
  - Verify form submission works with button click and Enter key
  - Verify empty input is rejected

### Step 3: Add styling for visual distinction
- Files: `styles.css`
- Test mode: test-after
- Work:
  - Add basic layout styling for readability
  - Style completed items with strikethrough and reduced opacity
  - Style buttons (complete, delete) for clear affordance
  - Add minimal spacing and visual hierarchy
  - Keep styling simple without frameworks (per engineering conventions)
- Verification:
  - Open `index.html` in browser and verify:
    - Completed items are visually distinguished from active items
    - UI elements are clearly labeled and easy to interact with
    - Layout is readable without excessive styling

## Acceptance Criteria Mapping

1. **Users can add a todo item** → Step 2 (addTodo function with form/Enter key support)
2. **Users can mark a todo item complete** → Step 2 (toggleComplete function with click handler)
3. **Users can delete a todo item** → Step 2 (deleteTodo function with click handler)
4. **The app can run locally without a backend** → Steps 1-3 (dependency-free, open index.html directly)

## Risks

1. **Browser compatibility**: Using modern JavaScript (ES6+) validated by Node.js may not catch all browser-specific issues. Mitigation: Test manually in a current browser; avoid bleeding-edge features.

2. **No automated tests**: Manual verification increases risk of regression. Mitigation: Keep implementation simple and focused; `.workflow/verify.sh` catches syntax errors.

3. **Open questions resolved by plan**:
   - Visual distinction for completed items: Yes, using strikethrough + opacity
   - Client-side persistence: No, per spec's explicit out-of-scope constraint
   - Input method: Both button and Enter key for better UX
   - Input validation: Yes, reject empty/whitespace-only input

## Material Deviation Rules

If during implementation any of the following occur, stop and escalate:

1. **Framework needed**: If vanilla JavaScript proves insufficient for the acceptance criteria, document why and request approval before adding dependencies.

2. **Backend required**: If client-side implementation cannot satisfy acceptance criteria, escalate rather than adding server components.

3. **Persistence needed**: If ephemeral state is insufficient, clarify with product whether the out-of-scope constraint should be relaxed.

4. **Verification script fails**: If `.workflow/verify.sh` reports errors that cannot be resolved while meeting acceptance criteria, document conflict and escalate.

5. **Browser compatibility blockers**: If modern JavaScript validated by Node.js fails in target browsers, document and request guidance on transpilation or compatibility requirements.
