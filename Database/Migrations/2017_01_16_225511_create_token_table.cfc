component
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public void function up()
    {
        var table = schema('remember_tokens');

        table.increments('id');
        table.timestamps();
        table.string('token').unique();

        table.create();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public void function down()
    {
        schema('remember_tokens').drop();
    }
}
