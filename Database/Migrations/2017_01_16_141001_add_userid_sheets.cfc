component
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public void function up()
    {
        var table = schema('sheets');
        table.integer('userID').nullable();
        table.foreign('userID').references('users', 'id').onDelete('cascade');
        table.update();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public void function down()
    {
        var table = schema('sheets');
        table.dropForeign('userID');
        table.dropColumn('userID');
    }
}
