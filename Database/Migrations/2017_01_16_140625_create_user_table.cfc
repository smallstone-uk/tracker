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

        table.increments('id');
        table.timestamps();
        table.string('username').unique();
        table.encrypted('password');

        table.create();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public void function down()
    {
        schema('users').drop();
    }
}
