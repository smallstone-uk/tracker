component
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public void function up()
    {
        var table = schema('users');

        table.integer('remember_token').nullable();
        table.foreign('remember_token').references('remember_tokens', 'id').onDelete('set null');

        table.update();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public void function down()
    {
        var table = schema('users');
        table.dropForeign('remember_token');
        table.dropColumn('remember_token');
    }
}
