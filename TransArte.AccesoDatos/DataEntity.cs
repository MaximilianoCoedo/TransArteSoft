using System;
using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;

namespace ProyTransArte.AccesoDatos
{
    /// <summary>
    /// Base class for all the Business Entities of the application
    /// </summary>
    public class BusinessEntity : IDisposable
    {
        #region Constants
        // Suffixes for stored procedures nomenclature.
        private const string Suffix_Insert = "_Add";
        private const string Suffix_InsertLinea = "_AddLinea";//
        private const string Suffix_Update = "_Upd";
        private const string Suffix_Delete = "_Del";
        private const string Suffix_DeleteBy = "_DelBy";
        private const string Suffix_UpdateBy = "_UpdBy";
        private const string Suffix_GetOne = "_GetOne";
        private const string Suffix_GetAll = "_GetAll";
        private const string Suffix_GetBy = "_GetBy";
        private const string Suffix_GetList = "_GetList";
        private const string Suffix_GetListAll = "_GetListAll";//
        private const string Suffix_GetSingleValue = "_GSV";
        private const string Suffix_GetForDisplay = "_GFD";
        private const string Suffix_GetForReport = "_RPT";

        // Messages for the exceptions managed and throwed by this module.
        private const string Exception_Transaction_Parameter = "The SqlTransaction object cannot be null, it must be initialized before calling this method.";
        private const string Exception_Connection_Parameter = "The SqlConnection object cannot be null, it must be initialized before calling this method.";
        private const string Exception_Entity_Parameter = "The entity name provided is empty. Please provide a consistent Name that matches its pair at the RDBMS.";
        private const string Exception_Filter_Parameter = "The filter name provided is empty or a null reference. Please provide a consistent one that matches its pair at the RDBMS.";
        private const string Exception_Report_Parameter = "The report name provided is empty or a null reference. Please provide a consistent one that matches its pair at the RDBMS.";
        private const string Exception_Values_Parameter = "There is no parameter in the parameter value array. The operation will not continue.";
        #endregion

        #region Private/Protected fields
        Microsoft.Practices.EnterpriseLibrary.Data.Database SqlHelper = null;
        private string table;
        #endregion

        #region Constructors
        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="entityName">table name</param>
        protected BusinessEntity(string entityName)
        {
            if (entityName == null || entityName == String.Empty)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "entityName"));
            }
            table = entityName;

            try
            {
                SqlHelper = DatabaseFactory.CreateDatabase();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        //#region Public methods
        #region Add
        /// <summary>
        /// Inserts a record into the Entity table that the class represent.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        /// <returns>an int representing the id assigned by the RDBMS to this new entity.</returns>
        public virtual int Add(SqlTransaction transaction, params object[] parameterValues)
        {
            // Argument validation area.
            if (transaction == null)
            {
                throw (new ArgumentNullException("transaction", Exception_Transaction_Parameter));
            }

            if (parameterValues == null || parameterValues.Length == 0)
            {
                throw (new ArgumentException(Exception_Values_Parameter, "parameterValues"));
            }

            try
            {
                return (Convert.ToInt32(SqlHelper.ExecuteScalar(transaction, table + Suffix_Insert, parameterValues)));

            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Inserts a record into the Entity table that the class represent.
        /// </summary>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        /// <returns>an int representing the id assigned by the RDBMS to this new entity.</returns>	
        /// 

        public virtual int Add(params object[] parameterValues)
        {
            // Argument validation area.
            if (parameterValues == null || parameterValues.Length == 0)
            {
                throw (new ArgumentException(Exception_Values_Parameter, "parameterValues"));
            }

            try
            {
                return (Convert.ToInt32(SqlHelper.ExecuteScalar(table + Suffix_Insert, parameterValues)));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Inserts a record into the Entity table that the class represent.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        /// <returns>an int representing the id assigned by the RDBMS to this new entity.</returns>
        protected int Add(SqlTransaction transaction, string targetTable, params object[] parameterValues)
        {
            // Argument validation area.
            if (transaction == null)
            {
                throw (new ArgumentNullException("transaction", Exception_Transaction_Parameter));
            }
            
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }
            
            if (parameterValues == null || parameterValues.Length == 0)
            {
                throw (new ArgumentException(Exception_Values_Parameter, "parameterValues"));
            }

            try
            {
                return (Convert.ToInt32(SqlHelper.ExecuteScalar(transaction, targetTable + Suffix_Insert, parameterValues)));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

  
        #endregion

        //#region Public methods
        #region AddLinea
        /// <summary>
        /// Inserts a record into the Entity table that the class represent.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        /// <returns>an int representing the id assigned by the RDBMS to this new entity.</returns>
        public virtual DataSet AddLinea()
        {
            try
            {
                return (SqlHelper.ExecuteDataSet(table + Suffix_InsertLinea));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }


        #endregion


        #region Update
        /// <summary>
        /// Updates an item based on the passed parameters.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        public virtual void Update(SqlTransaction transaction, params object[] parameterValues)
        {
            // Argument validation area.
            if (transaction == null)
            {
                throw (new ArgumentNullException("transaction", Exception_Transaction_Parameter));
            }
            
            try
            {
                SqlHelper.ExecuteNonQuery(transaction, table + Suffix_Update, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Updates an item based on the passed parameters.
        /// </summary>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        public virtual void Update(params object[] parameterValues)
        {
            // TODO: Verify the existence of at least one parameterValue??
            try
            {
                SqlHelper.ExecuteNonQuery(table + Suffix_Update, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Updates an item based on the passed parameters.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        protected void Update(SqlTransaction transaction, string targetTable, params object[] parameterValues)
        {
            // Argument validation area.
            if (transaction == null)
            {
                throw (new ArgumentNullException("transaction", Exception_Transaction_Parameter));
            }
            
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }

            try
            {
                SqlHelper.ExecuteNonQuery(transaction, targetTable + Suffix_Update, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Updates an item based on the passed parameters.
        /// </summary>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        protected void Update(string targetTable, params object[] parameterValues)
        {
            // Argument validation area.
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }

            // TODO: Verify the existence of at least one parameterValue??
            try
            {
                SqlHelper.ExecuteNonQuery(targetTable + Suffix_Update, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        #endregion

        #region UpdateBy
        /// <summary>
        /// Updates an item based on the passed parameters.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        public virtual void UpdateBy(SqlTransaction transaction, string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (transaction == null)
            {
                throw (new ArgumentNullException("transaction", Exception_Transaction_Parameter));
            }

            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }
            
            try
            {
                SqlHelper.ExecuteNonQuery(transaction, table + Suffix_UpdateBy + filterName, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Updates an item based on the passed parameters.
        /// </summary>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        public virtual void UpdateBy(string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }
            
            // TODO: Verify the existence of at least one parameterValue??
            try
            {
                SqlHelper.ExecuteNonQuery(table + Suffix_UpdateBy + filterName, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Updates an item based on the passed parameters.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        protected void UpdateBy(SqlTransaction transaction, string targetTable, string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (transaction == null)
            {
                throw (new ArgumentNullException("transaction", Exception_Transaction_Parameter));
            }
            
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }
            
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }

            try
            {
                SqlHelper.ExecuteNonQuery(transaction, targetTable + Suffix_UpdateBy + filterName, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Updates an item based on the passed parameters.
        /// </summary>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        protected void UpdateBy(string targetTable, string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }
            
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }
            
            // TODO: Verify the existence of at least one parameterValue??
            try
            {
                SqlHelper.ExecuteNonQuery(targetTable + Suffix_UpdateBy + filterName, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        #endregion

        #region Delete
        /// <summary>
        /// Deletes the specified item from the underlying entity table.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="id">the record id.</param>
        public virtual void Delete(SqlTransaction transaction, int id)
        {
            // Argument validation area.
            if (transaction == null)
            {
                throw (new ArgumentNullException("transaction", Exception_Transaction_Parameter));
            }

            try
            {
                SqlHelper.ExecuteNonQuery(transaction, table + Suffix_Delete, id);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Deletes the specified item from the underlying entity table.
        /// </summary>
        /// <param name="id">the record id.</param>
        public virtual void Delete(int id)
        {
            // TODO: Verify the id != 0 ??
            try
            {
                SqlHelper.ExecuteNonQuery(table + Suffix_Delete, id);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Deletes the specified item from the underlying entity table.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="id">the record id.</param>
        protected void Delete(SqlTransaction transaction, string targetTable, int id)
        {
            // Argument validation area.
            if (transaction == null)
            {
                throw (new ArgumentNullException("transaction", Exception_Transaction_Parameter));
            }

            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }

            try
            {
                SqlHelper.ExecuteNonQuery(transaction, targetTable + Suffix_Delete, id);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Deletes the specified item from the underlying entity table.
        /// </summary>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="id">the record id.</param>
        protected void Delete(string targetTable, int id)
        {
            // Argument validation area.
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }

            try
            {
                SqlHelper.ExecuteNonQuery(targetTable + Suffix_Delete, id);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        #endregion

        #region DeleteBy
        /// <summary>
        /// Deletes an item based on the passed parameters.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        public virtual void DeleteBy(SqlTransaction transaction, string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (transaction == null)
            {
                throw (new ArgumentNullException("transaction", Exception_Transaction_Parameter));
            }
            
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }
            
            try
            {
                SqlHelper.ExecuteNonQuery(transaction, table + Suffix_DeleteBy + filterName, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Deletes an item based on the passed parameters.
        /// </summary>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        public virtual void DeleteBy(string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }
            
            // TODO: Verify the existence of at least one parameterValue??
            try
            {
                SqlHelper.ExecuteNonQuery(table + Suffix_DeleteBy + filterName, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Deletes an item based on the passed parameters.
        /// </summary>
        /// <param name="transaction">an opened and created Sql Transaction.</param>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        protected void DeleteBy(SqlTransaction transaction, string targetTable, string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (transaction == null)
            {
                throw (new ArgumentNullException("transaction", Exception_Transaction_Parameter));
            }
            
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }
            
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }

            try
            {
                SqlHelper.ExecuteNonQuery(transaction, targetTable + Suffix_DeleteBy + filterName, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Deletes an item based on the passed parameters.
        /// </summary>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        protected void DeleteBy(string targetTable, string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }
            
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }

            // TODO: Verify the existence of at least one parameterValue??
            try
            {
                SqlHelper.ExecuteNonQuery(targetTable + Suffix_DeleteBy + filterName, parameterValues);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        #endregion

        #region Get Single Value
        /// <summary>
        /// Retrieves a System.Object<see cref="System.Object"/> containing a single value.
        /// </summary>
        /// <param name="filterName">the name of the filter.</param>
        /// <param name="parameterValues">a params array containing the entire set of parameters.</param>
        /// <returns>a System.Object containing the result, 
        /// that must be casted to the corresponding type.</returns>
        public object GetSingleValue(string filterName, params object[] parameterValues)
        {
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }

            try
            {
                if (parameterValues == null || parameterValues.Length == 0)
                {
                    return (SqlHelper.ExecuteScalar(this.table + Suffix_GetSingleValue + filterName, (object[])null));
                }

                return (SqlHelper.ExecuteScalar(this.table + Suffix_GetSingleValue + filterName, parameterValues));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        /// <summary>
        /// Retrieves a System.Object containing a single value.
        /// </summary>
        /// <param name="filterName">the name of the filter.</param>
        /// <returns>a System.Object containing the result, 
        /// that must be casted to the corresponding type.</returns>
        public object GetSingleValue(string filterName)
        {
            return (this.GetSingleValue(filterName, (object[])null));
        }
        #endregion

        #region Get One
        /// <summary>
        /// Retrieves a DataSet containing the data of a single entity.
        /// </summary>
        /// <param name="id">the id of the entity to retrieve.</param>
        /// <returns>a DataSet with the relevant data.</returns>
        public virtual DataSet GetOne(int id)
        {
            try
            {
                return (SqlHelper.ExecuteDataSet(table + Suffix_GetOne, id));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        public virtual DataSet GetOne(SqlTransaction transaction, int id)
        {
            try
            {
                return (SqlHelper.ExecuteDataSet(transaction, table + Suffix_GetOne, id));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Retrieves a DataSet containing the data of a single entity.
        /// </summary>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="id">the id of the entity to retrieve.</param>
        /// <returns>a DataSet with the relevant data.</returns>
        protected DataSet GetOne(string targetTable, int id)
        {
            // Argument validation area.
            // TODO: Verify the id != 0 ??
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }

            try
            {
                return (SqlHelper.ExecuteDataSet(targetTable + Suffix_GetOne, id));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        #endregion

        #region Get All

        /// <summary>
        /// Retrieves a DataSet containing the entire dataset of items of an entity.
        /// </summary>
        /// <remarks>
        /// e.g.:
        ///  GetAll();
        /// </remarks>
        /// <returns>a DataSet with the relevant data.</returns>
        public virtual DataSet GetAll()
        {
            try
            {
                return (SqlHelper.ExecuteDataSet(table + Suffix_GetAll));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Retrieves a DataSet containing the entire dataset of items of an entity.
        /// </summary>
        /// </remarks>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <returns>a DataSet with the relevant data.</returns>
        protected DataSet GetAll(string targetTable)
        {
            // Arguments Validation Area
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }

            try
            {
                return (SqlHelper.ExecuteDataSet(targetTable + Suffix_GetAll));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        #endregion

        #region Get List
        /// <summary>
        /// Retrieves a DataSet containing the entire dataset of items of an entity to fill a list or combo (id and description).
        /// </summary>
        /// <returns>a DataSet with the relevant data.</returns>
        public virtual DataSet GetList()
        {
            try
            {
                return (SqlHelper.ExecuteDataSet(table + Suffix_GetList));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Retrieves a DataSet containing the entire dataset of items of an entity to fill a list or combo (id and description).
        /// </summary>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <returns>a DataSet with the relevant data.</returns>
        protected DataSet GetList(string targetTable)
        {
            // Argument validation area.
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }

            try
            {
                return (SqlHelper.ExecuteDataSet(targetTable + Suffix_GetList));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        #endregion

        #region Get List All
        /// <summary>
        /// Retrieves a DataSet containing the entire dataset of items of an entity to fill a list or combo (id and description).
        /// </summary>
        /// <returns>a DataSet with the relevant data.</returns>
        public virtual DataSet GetListAll()
        {
            try
            {
                return (SqlHelper.ExecuteDataSet(table + Suffix_GetListAll));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Retrieves a DataSet containing the entire dataset of items of an entity to fill a list or combo (id and description).
        /// </summary>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <returns>a DataSet with the relevant data.</returns>
        protected DataSet GetListAll(string targetTable)
        {
            // Argument validation area.
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }

            try
            {
                return (SqlHelper.ExecuteDataSet(targetTable + Suffix_GetListAll));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        #endregion

        #region Get By (filter)
        /// <summary>
        /// Retrieves a DataSet containing the entire dataset of items of an entity filtered by some specified criteria.
        /// </summary>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <returns>a DataSet with the relevant data.</returns>
        public virtual DataSet GetBy(string filterName)
        {
            // Argument validation area.
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }

            try
            {
                return (SqlHelper.ExecuteDataSet(table + Suffix_GetBy + filterName));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Retrieves a DataSet containing the entire dataset of items of an entity filtered by some specified criteria.
        /// </summary>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <returns>a DataSet with the relevant data.</returns>
        protected DataSet GetBy(string targetTable, string filterName)
        {
            // Argument validation area.
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }

            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }

            try
            {
                return (SqlHelper.ExecuteDataSet(targetTable + Suffix_GetBy + filterName));
            }
            catch (SqlException ex)
            {
                throw (ex);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        #endregion

        #region Get By (filter) with parameters
        /// <summary>
        /// Retrieves a DataSet containing the entire dataset of items of an entity filtered by some specified criteria
        /// and a number of retrieved arguments.
        /// </summary>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        /// <returns>a DataSet with the relevant data.</returns>
        public virtual DataSet GetByN(string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }
            
            if (parameterValues == null || parameterValues.Length == 0)
            {
                throw (new ArgumentException(Exception_Values_Parameter, "parameterValues"));
            }

            try
            {
                return (SqlHelper.ExecuteDataSet(table + Suffix_GetBy + filterName, parameterValues));
            }
            catch (SqlException ex)
            {
                throw (ex);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        public virtual DataSet GetByN(SqlTransaction transaction, string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }

            if (parameterValues == null || parameterValues.Length == 0)
            {
                throw (new ArgumentException(Exception_Values_Parameter, "parameterValues"));
            }

            try
            {
                return (SqlHelper.ExecuteDataSet(transaction, table + Suffix_GetBy + filterName, parameterValues));
            }
            catch (SqlException ex)
            {
                throw (ex);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Retrieves a DataSet containing the entire dataset of items of an entity filtered by some specified criteria
        /// and a number of retrieved arguments.
        /// </summary>
        /// <param name="targetTable">specifies the target table of the operation.</param>
        /// <param name="filterName">string containing the Filter name.</param>
        /// <param name="parameterValues">an array of objects to be passed to the operation.</param>
        /// <returns>a DataSet with the relevant data.</returns>
       /* protected DataSet GetByN(string targetTable, string filterName, params object[] parameterValues)
        {
            // Argument validation area.
            if (targetTable == null || targetTable.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "targetTable"));
            }
            
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }
            
            if (parameterValues == null || parameterValues.Length == 0)
            {
                throw (new ArgumentException(Exception_Values_Parameter, "parameterValues"));
            }

            try
            {
                return (SqlHelper.ExecuteDataSet(targetTable + Suffix_GetBy + filterName, parameterValues));
            }
            catch (SqlException ex)
            {
                throw (ex);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }*/
        #endregion

        #region Get for Report
        /// <summary>
        /// Retrieves a System.Data.DataSet<see cref="System.Data.DataSet"/> containing a filtered
        /// set of rows for Report generating purposes.
        /// </summary>
        /// <param name="reportName">the name of the report.</param>
        /// <param name="parameterValues">a params array containing the entire set of parameters.</param>
        /// <returns>a System.Data.DataSet<see cref="System.Data.DataSet"/> containing the resulting DataSet.</returns>
        public DataSet GetForReport(string reportName, params object[] parameterValues)
        {
            // Argument Validation checks.
            if (reportName == null || reportName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "reportName"));
            }

            try
            {
                if (parameterValues == null || parameterValues.Length == 0)
                {
                    return (SqlHelper.ExecuteDataSet(table + Suffix_GetForReport + reportName, (object[])null));
                }

                return (SqlHelper.ExecuteDataSet(table + Suffix_GetForReport + reportName, parameterValues));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        /// <summary>
        /// Retrieves a System.Data.DataSet<see cref="System.Data.DataSet"/> containing a filtered
        /// set of rows for Report generating purposes.
        /// </summary>
        /// <param name="reportName">the name of the report.</param>
        /// <returns>a System.Data.DataSet<see cref="System.Data.DataSet"/> containing the resulting DataSet.</returns>
        public DataSet GetForReport(string reportName)
        {
            return (this.GetForReport(reportName, (object[])null));
        }
        #endregion

        #region Get for Display
        /// <summary>
        /// Retrieves a System.Data.DataSet<see cref="System.Data.DataSet"/> containing a filtered
        /// set of rows with human readable information for GUI displaying purposes.
        /// </summary>
        /// <param name="filterName">the name of the filter.</param>
        /// <param name="parameterValues">a params array containing the entire set of parameters.</param>
        /// <returns>a System.Data.DataSet<see cref="System.Data.DataSet"/> containing the resulting DataSet.</returns>
        public DataSet GetForDisplay(string filterName, params object[] parameterValues)
        {
            // Argument Validation checks.
            if (filterName == null || filterName.Length == 0)
            {
                throw (new ArgumentException(Exception_Filter_Parameter, "filterName"));
            }

            try
            {
                if (parameterValues == null || parameterValues.Length == 0)
                {
                    return (SqlHelper.ExecuteDataSet(table + Suffix_GetForDisplay + filterName, (object[])null));
                }

                return (SqlHelper.ExecuteDataSet(table + Suffix_GetForDisplay + filterName, parameterValues));
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        /// <summary>
        /// Retrieves a System.Data.DataSet<see cref="System.Data.DataSet"/> containing a filtered
        /// set of rows with human readable information for GUI displaying purposes.
        /// </summary>
        /// <param name="filterName">the name of the filter.</param>
        /// <returns>a System.Data.DataSet<see cref="System.Data.DataSet"/> containing the resulting DataSet.</returns>
        public DataSet GetForDisplay(string filterName)
        {
            return (this.GetForDisplay(filterName, (object[])null));
        }
        #endregion

        #region GetReaderByN
        public SqlDataReader GetReaderByN(string storedProcedure, params object[] parameterValues)
        {
            // Argument validation area.
            if (storedProcedure == null || storedProcedure.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "storedProcedure"));
            }

            if (parameterValues == null || parameterValues.Length == 0)
            {
                throw (new ArgumentException(Exception_Values_Parameter, "parameterValues"));
            }

            try
            {
                return (SqlDataReader)SqlHelper.ExecuteReader(table + Suffix_GetBy + storedProcedure, parameterValues);
            }
            catch (SqlException ex)
            {
                throw (ex);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        public SqlDataReader GetReader(string query)
        {
            // Argument validation area.
            if (query == null || query.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "query"));
            }

            try
            {
                return (SqlDataReader)SqlHelper.ExecuteReader(CommandType.Text, query);
            }
            catch (SqlException ex)
            {
                throw (ex);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        public SqlDataReader GetReader(System.Data.SqlClient.SqlTransaction transaction, string query)
        {
            // Argument validation area.
            if (query == null || query.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "query"));
            }

            try
            {
                return (SqlDataReader)SqlHelper.ExecuteReader(transaction, CommandType.Text, query);
            }
            catch (SqlException ex)
            {
                throw (ex);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        public DataSet ExecuteDataSet(System.Data.SqlClient.SqlTransaction transaction, string query)
        {
            // Argument validation area.
            if (query == null || query.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "query"));
            }

            try
            {
                return SqlHelper.ExecuteDataSet(transaction, CommandType.Text, query);
            }
            catch (SqlException ex)
            {
                throw (ex);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }


        public DataSet ExecuteDataSet(string query)
        {
            // Argument validation area.
            if (query == null || query.Length == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "query"));
            }

            try
            {
                return SqlHelper.ExecuteDataSet(CommandType.Text, query);
            }
            catch (SqlException ex)
            {
                throw (ex);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        public object ExecuteQuery(string query)
        {
            // Argument validation area.
            if (query == null || query.Length  == 0)
            {
                throw (new ArgumentException(Exception_Entity_Parameter, "query"));
            }

            try
            {
                return SqlHelper.ExecuteScalar(CommandType.Text, query);
            }
            catch (SqlException ex)
            {
                throw (ex);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        #endregion

        #region Implementation of IDisposable
        /// <summary>
        /// 
        /// </summary>
        public void Dispose()
        {

        }
        #endregion

        #region Base Object Overriding
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return (null);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string ToString(int id)
        {
            return (null);
        }

        /// <summary>
        /// 
        /// </summary>
        ~BusinessEntity() { }
        #endregion
        
        

        #region Helper Methods
        #endregion
    }


}


       