Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 508FA394976
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 29 May 2021 02:19:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lmmhf-0007B7-Vp
	for lists+kgdb-bugreport@lfdr.de; Sat, 29 May 2021 00:19:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiederm@xmission.com>) id 1lmmhe-0007Ay-AO
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 May 2021 00:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rae87WzbawH4o1vGi3MK3yxWh8j/20kZrbK7AGt22T0=; b=W8eURcKjzo3sYBhmpTYP+c40D
 C7X0b+ch4M0IApVWC8xFpctozpiS8SrZxtzo54ZRjGxf/bwcHJdzGr7KzWrR+uY2BOk05s6dUqWP0
 tFbqpwwwQCoL4R1tJHc/NH1cwfqzeMYlbv7E94D4DDm/DOxHJofOUl2KJLH201+XL5CDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rae87WzbawH4o1vGi3MK3yxWh8j/20kZrbK7AGt22T0=; b=Dgu7E+Wiil7QmmlNzLRqKJsNwB
 /5eEuwhmF16DOjcj8CxLzfI1X+ou+fVgbQeG3BXbIbvY3XLczEVQsmTTNu0qlbkrfqUdmrjnazJM/
 LfwBLwskbArDqqFGJYtIAoJxcg7EppT/CEj1B5ipe15z2KNqMaj1zCYvcvyXKT+QUWdw=;
Received: from out02.mta.xmission.com ([166.70.13.232])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lmmhT-001UFM-Kf
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 May 2021 00:19:47 +0000
Received: from in01.mta.xmission.com ([166.70.13.51])
 by out02.mta.xmission.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1lmlkZ-00Ewey-Eo; Fri, 28 May 2021 17:18:43 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=fess.xmission.com) by in01.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1lmlkW-0003Eo-Uv; Fri, 28 May 2021 17:18:43 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Zhen Lei <thunder.leizhen@huawei.com>
References: <20210526035345.9113-1-thunder.leizhen@huawei.com>
 <20210526035345.9113-2-thunder.leizhen@huawei.com>
Date: Fri, 28 May 2021 18:18:22 -0500
In-Reply-To: <20210526035345.9113-2-thunder.leizhen@huawei.com> (Zhen Lei's
 message of "Wed, 26 May 2021 11:53:45 +0800")
Message-ID: <m1a6oela69.fsf@fess.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1lmlkW-0003Eo-Uv; ; ; mid=<m1a6oela69.fsf@fess.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/4p5UnKj/qM1x4QSv2bIqIrt93lb/Gu5I=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: *****
X-Spam-Status: No, score=5.9 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,FVGT_m_MULTI_ODD,LotsOfNums_01,
 T_TM2_M_HEADER_IN_MSG,T_XMDrugObfuBody_00,T_XMDrugObfuBody_08,
 XMNoVowels,XM_B_SpammyWords,XM_B_SpammyWords2 autolearn=disabled
 version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000]
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 *  1.2 LotsOfNums_01 BODY: Lots of long strings of numbers
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  1.0 T_XMDrugObfuBody_08 obfuscated drug references
 *  1.0 T_XMDrugObfuBody_00 obfuscated drug references
 *  0.4 FVGT_m_MULTI_ODD Contains multiple odd letter combinations
 *  0.2 XM_B_SpammyWords One or more commonly used spammy words
 *  0.8 XM_B_SpammyWords2 Two or more commony used spammy words
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *****;Zhen Lei <thunder.leizhen@huawei.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1984 ms - load_scoreonly_sql: 0.07 (0.0%),
 signal_user_changed: 12 (0.6%), b_tie_ro: 10 (0.5%), parse: 2.4 (0.1%),
 extract_message_metadata: 26 (1.3%), get_uri_detail_list: 12 (0.6%),
 tests_pri_-1000: 17 (0.9%), tests_pri_-950: 1.27 (0.1%),
 tests_pri_-900: 1.17 (0.1%), tests_pri_-90: 188 (9.5%), check_bayes:
 184 (9.3%), b_tokenize: 41 (2.1%), b_tok_get_all: 29 (1.5%),
 b_comp_prob: 8 (0.4%), b_tok_touch_all: 101 (5.1%), b_finish: 0.99
 (0.1%), tests_pri_0: 1720 (86.7%), check_dkim_signature: 1.16 (0.1%),
 check_dkim_adsp: 2.2 (0.1%), poll_dns_idle: 0.26 (0.0%), tests_pri_10:
 2.1 (0.1%), tests_pri_500: 9 (0.4%), rewrite_mail: 0.00 (0.0%)
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [166.70.13.232 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lmmhT-001UFM-Kf
Subject: Re: [Kgdb-bugreport] [PATCH 1/1] kernel: fix numerous spelling
 mistakes
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>,
 Balbir Singh <bsingharora@gmail.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Marek
 Szyprowski <m.szyprowski@samsung.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 "Naveen N .
 Rao" <naveen.n.rao@linux.ibm.com>, Darren Hart <dvhart@infradead.org>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Barry Song <song.bao.hua@hisilicon.com>, Stephen Boyd <sboyd@kernel.org>,
 kexec@lists.infradead.org, Oleg Nesterov <oleg@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jessica Yu <jeyu@kernel.org>, Tejun Heo <tj@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Zhen Lei <thunder.leizhen@huawei.com> writes:

> Fix some spelling mistakes in comments:
> suspeneded ==> suspended
> occuring ==> occurring
> wont ==> won't
> detatch ==> detach
> represntation ==> representation
> hexidecimal ==> hexadecimal
> delimeter ==> delimiter
> architecure ==> architecture
> accumalator ==> accumulator
> evertything ==> everything
> contingous ==> contiguous
> useable ==> usable
> musn't ==> mustn't
> alloed ==> allowed
> immmediately ==> immediately
> Allocted ==> Allocated
> noone ==> no one
> unparseable ==> unparsable
> dependend ==> dependent
> callled ==> called
> alreay ==> already
> childs ==> children
> implemention ==> implementation
> situration ==> situation
> overriden ==> overridden
> asynchonous ==> asynchronous
> accumalate ==> accumulate
> syncrhonized ==> synchronized
> therefor ==> therefore
> ther ==> their
> capabilites ==> capabilities
> lentgh ==> length
> watchog ==> watchdog
> assing ==> assign
> Retun ==> Return

I took a quick read through and everything looks like a good spelling
correction, and on top of that this looks safe as it just comments being
changed?

How were you thinking of getting this merged?

Do we have a misc maintainer?  If the individual maintainers need to
merge this than this patch should probably get split as these files
cover lot areas that different people take care of.

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  kernel/acct.c                  | 2 +-
>  kernel/context_tracking.c      | 2 +-
>  kernel/cpu.c                   | 2 +-
>  kernel/debug/debug_core.c      | 2 +-
>  kernel/debug/kdb/kdb_main.c    | 8 ++++----
>  kernel/debug/kdb/kdb_private.h | 2 +-
>  kernel/delayacct.c             | 2 +-
>  kernel/dma/map_benchmark.c     | 2 +-
>  kernel/dma/swiotlb.c           | 2 +-
>  kernel/exit.c                  | 2 +-
>  kernel/hung_task.c             | 2 +-
>  kernel/kexec_core.c            | 2 +-
>  kernel/kprobes.c               | 2 +-
>  kernel/latencytop.c            | 2 +-
>  kernel/module.c                | 4 ++--
>  kernel/notifier.c              | 2 +-
>  kernel/padata.c                | 2 +-
>  kernel/panic.c                 | 2 +-
>  kernel/pid.c                   | 2 +-
>  kernel/ptrace.c                | 2 +-
>  kernel/relay.c                 | 2 +-
>  kernel/signal.c                | 4 ++--
>  kernel/smp.c                   | 2 +-
>  kernel/taskstats.c             | 2 +-
>  kernel/time/alarmtimer.c       | 2 +-
>  kernel/time/timer.c            | 4 ++--
>  kernel/umh.c                   | 2 +-
>  kernel/user_namespace.c        | 2 +-
>  kernel/usermode_driver.c       | 2 +-
>  kernel/watchdog.c              | 2 +-
>  kernel/workqueue.c             | 4 ++--
>  31 files changed, 38 insertions(+), 38 deletions(-)
>
> diff --git a/kernel/acct.c b/kernel/acct.c
> index a64102be2bb0..5ace865b6176 100644
> --- a/kernel/acct.c
> +++ b/kernel/acct.c
> @@ -26,7 +26,7 @@
>   *  XTerms and EMACS are manifestations of pure evil. 21/10/98, AV.
>   *
>   *  Fixed a nasty interaction with sys_umount(). If the accounting
> - *  was suspeneded we failed to stop it on umount(). Messy.
> + *  was suspended we failed to stop it on umount(). Messy.
>   *  Another one: remount to readonly didn't stop accounting.
>   *	Question: what should we do if we have CAP_SYS_ADMIN but not
>   *  CAP_SYS_PACCT? Current code does the following: umount returns -EBUSY
> diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> index 36a98c48aedc..53f525604ce8 100644
> --- a/kernel/context_tracking.c
> +++ b/kernel/context_tracking.c
> @@ -108,7 +108,7 @@ void context_tracking_enter(enum ctx_state state)
>  	unsigned long flags;
>  
>  	/*
> -	 * Some contexts may involve an exception occuring in an irq,
> +	 * Some contexts may involve an exception occurring in an irq,
>  	 * leading to that nesting:
>  	 * rcu_irq_enter() rcu_user_exit() rcu_user_exit() rcu_irq_exit()
>  	 * This would mess up the dyntick_nesting count though. And rcu_irq_*()
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index e538518556f4..f6f6613a4c04 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -832,7 +832,7 @@ cpuhp_invoke_ap_callback(int cpu, enum cpuhp_state state, bool bringup,
>  	}
>  
>  	/*
> -	 * Clean up the leftovers so the next hotplug operation wont use stale
> +	 * Clean up the leftovers so the next hotplug operation won't use stale
>  	 * data.
>  	 */
>  	st->node = st->last = NULL;
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 4708aec492df..a1f26766eb90 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -1032,7 +1032,7 @@ dbg_notify_reboot(struct notifier_block *this, unsigned long code, void *x)
>  	/*
>  	 * Take the following action on reboot notify depending on value:
>  	 *    1 == Enter debugger
> -	 *    0 == [the default] detatch debug client
> +	 *    0 == [the default] detach debug client
>  	 *   -1 == Do nothing... and use this until the board resets
>  	 */
>  	switch (kgdbreboot) {
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 622410c45da1..d8ee5647b732 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -253,7 +253,7 @@ static char *kdballocenv(size_t bytes)
>   * Parameters:
>   *	match	A character string representing a numeric value
>   * Outputs:
> - *	*value  the unsigned long represntation of the env variable 'match'
> + *	*value  the unsigned long representation of the env variable 'match'
>   * Returns:
>   *	Zero on success, a kdb diagnostic on failure.
>   */
> @@ -356,7 +356,7 @@ static void kdb_printenv(void)
>   * Parameters:
>   *	arg	A character string representing a numeric value
>   * Outputs:
> - *	*value  the unsigned long represntation of arg.
> + *	*value  the unsigned long representation of arg.
>   * Returns:
>   *	Zero on success, a kdb diagnostic on failure.
>   */
> @@ -470,7 +470,7 @@ static int kdb_check_regs(void)
>   *	symbol name, and offset to the caller.
>   *
>   *	The argument may consist of a numeric value (decimal or
> - *	hexidecimal), a symbol name, a register name (preceded by the
> + *	hexadecimal), a symbol name, a register name (preceded by the
>   *	percent sign), an environment variable with a numeric value
>   *	(preceded by a dollar sign) or a simple arithmetic expression
>   *	consisting of a symbol name, +/-, and a numeric constant value
> @@ -894,7 +894,7 @@ static void parse_grep(const char *str)
>   *	Limited to 20 tokens.
>   *
>   *	Real rudimentary tokenization. Basically only whitespace
> - *	is considered a token delimeter (but special consideration
> + *	is considered a token delimiter (but special consideration
>   *	is taken of the '=' sign as used by the 'set' command).
>   *
>   *	The algorithm used to tokenize the input string relies on
> diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
> index ccbed9089808..170c69aedebb 100644
> --- a/kernel/debug/kdb/kdb_private.h
> +++ b/kernel/debug/kdb/kdb_private.h
> @@ -64,7 +64,7 @@
>  
>  /*
>   * KDB_MAXBPT describes the total number of breakpoints
> - * supported by this architecure.
> + * supported by this architecture.
>   */
>  #define KDB_MAXBPT	16
>  
> diff --git a/kernel/delayacct.c b/kernel/delayacct.c
> index 51530d5b15a8..79bb5658f171 100644
> --- a/kernel/delayacct.c
> +++ b/kernel/delayacct.c
> @@ -74,7 +74,7 @@ void __delayacct_tsk_init(struct task_struct *tsk)
>  
>  /*
>   * Finish delay accounting for a statistic using its timestamps (@start),
> - * accumalator (@total) and @count
> + * accumulator (@total) and @count
>   */
>  static void delayacct_end(raw_spinlock_t *lock, u64 *start, u64 *total, u32 *count)
>  {
> diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
> index 9b9af1bd6be3..e165d4997bfd 100644
> --- a/kernel/dma/map_benchmark.c
> +++ b/kernel/dma/map_benchmark.c
> @@ -76,7 +76,7 @@ static int map_benchmark_thread(void *data)
>  		 * for a non-coherent device, if we don't stain them in the
>  		 * cache, this will give an underestimate of the real-world
>  		 * overhead of BIDIRECTIONAL or TO_DEVICE mappings;
> -		 * 66 means evertything goes well! 66 is lucky.
> +		 * 66 means everything goes well! 66 is lucky.
>  		 */
>  		if (map->dir != DMA_FROM_DEVICE)
>  			memset(buf, 0x66, size);
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 8ca7d505d61c..58bf3f96d92f 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -66,7 +66,7 @@ enum swiotlb_force swiotlb_force;
>  struct io_tlb_mem *io_tlb_default_mem;
>  
>  /*
> - * Max segment that we can provide which (if pages are contingous) will
> + * Max segment that we can provide which (if pages are contiguous) will
>   * not be bounced (unless SWIOTLB_FORCE is set).
>   */
>  static unsigned int max_segment;
> diff --git a/kernel/exit.c b/kernel/exit.c
> index fd1c04193e18..b6d7d67cc117 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -789,7 +789,7 @@ void __noreturn do_exit(long code)
>  	if (group_dead) {
>  		/*
>  		 * If the last thread of global init has exited, panic
> -		 * immediately to get a useable coredump.
> +		 * immediately to get a usable coredump.
>  		 */
>  		if (unlikely(is_global_init(tsk)))
>  			panic("Attempted to kill init! exitcode=0x%08x\n",
> diff --git a/kernel/hung_task.c b/kernel/hung_task.c
> index 396ebaebea3f..04f2538369d3 100644
> --- a/kernel/hung_task.c
> +++ b/kernel/hung_task.c
> @@ -98,7 +98,7 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
>  	/*
>  	 * When a freshly created task is scheduled once, changes its state to
>  	 * TASK_UNINTERRUPTIBLE without having ever been switched out once, it
> -	 * musn't be checked.
> +	 * mustn't be checked.
>  	 */
>  	if (unlikely(!switch_count))
>  		return;
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index f099baee3578..003fa141466b 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -179,7 +179,7 @@ int sanity_check_segment_list(struct kimage *image)
>  	}
>  
>  	/* Verify our destination addresses do not overlap.
> -	 * If we alloed overlapping destination addresses
> +	 * If we allowed overlapping destination addresses
>  	 * through very weird things can happen with no
>  	 * easy explanation as one segment stops on another.
>  	 */
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 745f08fdd7a6..b56ba9ecdc65 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -631,7 +631,7 @@ void wait_for_kprobe_optimizer(void)
>  	while (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list)) {
>  		mutex_unlock(&kprobe_mutex);
>  
> -		/* this will also make optimizing_work execute immmediately */
> +		/* this will also make optimizing_work execute immediately */
>  		flush_delayed_work(&optimizing_work);
>  		/* @optimizing_work might not have been queued yet, relax */
>  		cpu_relax();
> diff --git a/kernel/latencytop.c b/kernel/latencytop.c
> index 166d7bf49666..61baf936a52d 100644
> --- a/kernel/latencytop.c
> +++ b/kernel/latencytop.c
> @@ -127,7 +127,7 @@ account_global_scheduler_latency(struct task_struct *tsk,
>  	if (i >= MAXLR - 1)
>  		return;
>  
> -	/* Allocted a new one: */
> +	/* Allocated a new one: */
>  	memcpy(&latency_record[i], lat, sizeof(struct latency_record));
>  }
>  
> diff --git a/kernel/module.c b/kernel/module.c
> index 1d0e59f95a9a..e99df21490b4 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -2156,7 +2156,7 @@ static void free_module(struct module *mod)
>  
>  	/*
>  	 * We leave it in list to prevent duplicate loads, but make sure
> -	 * that noone uses it while it's being deconstructed.
> +	 * that no one uses it while it's being deconstructed.
>  	 */
>  	mutex_lock(&module_mutex);
>  	mod->state = MODULE_STATE_UNFORMED;
> @@ -2893,7 +2893,7 @@ static int module_sig_check(struct load_info *info, int flags)
>  	default:
>  		/*
>  		 * All other errors are fatal, including lack of memory,
> -		 * unparseable signatures, and signature check failures --
> +		 * unparsable signatures, and signature check failures --
>  		 * even if signatures aren't required.
>  		 */
>  		return err;
> diff --git a/kernel/notifier.c b/kernel/notifier.c
> index 1b019cbca594..f4b952e19031 100644
> --- a/kernel/notifier.c
> +++ b/kernel/notifier.c
> @@ -179,7 +179,7 @@ int atomic_notifier_call_chain_robust(struct atomic_notifier_head *nh,
>  	int ret;
>  
>  	/*
> -	 * Musn't use RCU; because then the notifier list can
> +	 * Mustn't use RCU; because then the notifier list can
>  	 * change between the up and down traversal.
>  	 */
>  	spin_lock_irqsave(&nh->lock, flags);
> diff --git a/kernel/padata.c b/kernel/padata.c
> index d4d3ba6e1728..a5dae323566d 100644
> --- a/kernel/padata.c
> +++ b/kernel/padata.c
> @@ -562,7 +562,7 @@ static void padata_init_reorder_list(struct parallel_data *pd)
>  	}
>  }
>  
> -/* Allocate and initialize the internal cpumask dependend resources. */
> +/* Allocate and initialize the internal cpumask dependent resources. */
>  static struct parallel_data *padata_alloc_pd(struct padata_shell *ps)
>  {
>  	struct padata_instance *pinst = ps->pinst;
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 332736a72a58..598bb0affdb0 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -298,7 +298,7 @@ void panic(const char *fmt, ...)
>  	 * buffer.  Try to acquire the lock then release it regardless of the
>  	 * result.  The release will also print the buffers out.  Locks debug
>  	 * should be disabled to avoid reporting bad unlock balance when
> -	 * panic() is not being callled from OOPS.
> +	 * panic() is not being called from OOPS.
>  	 */
>  	debug_locks_off();
>  	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
> diff --git a/kernel/pid.c b/kernel/pid.c
> index ebdf9c60cd0b..798d41271da2 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -213,7 +213,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
>  				       tid + 1, GFP_ATOMIC);
>  			/*
>  			 * If ENOSPC is returned it means that the PID is
> -			 * alreay in use. Return EEXIST in that case.
> +			 * already in use. Return EEXIST in that case.
>  			 */
>  			if (nr == -ENOSPC)
>  				nr = -EEXIST;
> diff --git a/kernel/ptrace.c b/kernel/ptrace.c
> index 2997ca600d18..c51f31c74bf1 100644
> --- a/kernel/ptrace.c
> +++ b/kernel/ptrace.c
> @@ -505,7 +505,7 @@ static int ptrace_traceme(void)
>  }
>  
>  /*
> - * Called with irqs disabled, returns true if childs should reap themselves.
> + * Called with irqs disabled, returns true if children should reap themselves.
>   */
>  static int ignoring_children(struct sighand_struct *sigh)
>  {
> diff --git a/kernel/relay.c b/kernel/relay.c
> index d1a67fbb819d..4a5e58be9731 100644
> --- a/kernel/relay.c
> +++ b/kernel/relay.c
> @@ -840,7 +840,7 @@ static int relay_file_mmap(struct file *filp, struct vm_area_struct *vma)
>   *	@filp: the file
>   *	@wait: poll table
>   *
> - *	Poll implemention.
> + *	Poll implementation.
>   */
>  static __poll_t relay_file_poll(struct file *filp, poll_table *wait)
>  {
> diff --git a/kernel/signal.c b/kernel/signal.c
> index f7c6ffcbd044..da759ef4c3c6 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1541,7 +1541,7 @@ static inline bool kill_as_cred_perm(const struct cred *cred,
>   * There is nothing in the encoding that can allow
>   * copy_siginfo_to_user32 to detect this confusion of formats, so
>   * handle this by requiring the caller of kill_pid_usb_asyncio to
> - * notice when this situration takes place and to store the 32bit
> + * notice when this situation takes place and to store the 32bit
>   * pointer in sival_int, instead of sival_addr of the sigval_t addr
>   * parameter.
>   */
> @@ -3348,7 +3348,7 @@ int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from)
>   *
>   * Note: This function does not work properly for the SIGCHLD on x32, but
>   * fortunately it doesn't have to.  The only valid callers for this function are
> - * copy_siginfo_to_user32, which is overriden for x32 and the coredump code.
> + * copy_siginfo_to_user32, which is overridden for x32 and the coredump code.
>   * The latter does not care because SIGCHLD will never cause a coredump.
>   */
>  void copy_siginfo_to_external32(struct compat_siginfo *to,
> diff --git a/kernel/smp.c b/kernel/smp.c
> index 52bf159ec400..0634bf6f1492 100644
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -769,7 +769,7 @@ EXPORT_SYMBOL(smp_call_function_single);
>   * @cpu: The CPU to run on.
>   * @csd: Pre-allocated and setup data structure
>   *
> - * Like smp_call_function_single(), but the call is asynchonous and
> + * Like smp_call_function_single(), but the call is asynchronous and
>   * can thus be done from contexts with disabled interrupts.
>   *
>   * The caller passes his own pre-allocated data structure
> diff --git a/kernel/taskstats.c b/kernel/taskstats.c
> index 2b4898b4752e..19665a32ad42 100644
> --- a/kernel/taskstats.c
> +++ b/kernel/taskstats.c
> @@ -261,7 +261,7 @@ static void fill_tgid_exit(struct task_struct *tsk)
>  
>  	/*
>  	 * Each accounting subsystem calls its functions here to
> -	 * accumalate its per-task stats for tsk, into the per-tgid structure
> +	 * accumulate its per-task stats for tsk, into the per-tgid structure
>  	 *
>  	 *	per-task-foo(tsk->signal->stats, tsk);
>  	 */
> diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
> index 5897828b9d7e..a400139b9a9c 100644
> --- a/kernel/time/alarmtimer.c
> +++ b/kernel/time/alarmtimer.c
> @@ -35,7 +35,7 @@
>  
>  /**
>   * struct alarm_base - Alarm timer bases
> - * @lock:		Lock for syncrhonized access to the base
> + * @lock:		Lock for synchronized access to the base
>   * @timerqueue:		Timerqueue head managing the list of events
>   * @get_ktime:		Function to read the time correlating to the base
>   * @get_timespec:	Function to read the namespace time correlating to the base
> diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> index 84332f01dc57..df6585281713 100644
> --- a/kernel/time/timer.c
> +++ b/kernel/time/timer.c
> @@ -62,7 +62,7 @@ EXPORT_SYMBOL(jiffies_64);
>  
>  /*
>   * The timer wheel has LVL_DEPTH array levels. Each level provides an array of
> - * LVL_SIZE buckets. Each level is driven by its own clock and therefor each
> + * LVL_SIZE buckets. Each level is driven by its own clock and therefore each
>   * level has a different granularity.
>   *
>   * The level granularity is:		LVL_CLK_DIV ^ lvl
> @@ -70,7 +70,7 @@ EXPORT_SYMBOL(jiffies_64);
>   *
>   * The array level of a newly armed timer depends on the relative expiry
>   * time. The farther the expiry time is away the higher the array level and
> - * therefor the granularity becomes.
> + * therefore the granularity becomes.
>   *
>   * Contrary to the original timer wheel implementation, which aims for 'exact'
>   * expiry of the timers, this implementation removes the need for recascading
> diff --git a/kernel/umh.c b/kernel/umh.c
> index 36c123360ab8..3c805dbf9fd9 100644
> --- a/kernel/umh.c
> +++ b/kernel/umh.c
> @@ -74,7 +74,7 @@ static int call_usermodehelper_exec_async(void *data)
>  	spin_unlock_irq(&current->sighand->siglock);
>  
>  	/*
> -	 * Initial kernel threads share ther FS with init, in order to
> +	 * Initial kernel threads share their FS with init, in order to
>  	 * get the init root directory. But we've now created a new
>  	 * thread that is going to execve a user process and has its own
>  	 * 'struct fs_struct'. Reset umask to the default.
> diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
> index 8d62863721b0..42131f7f1e94 100644
> --- a/kernel/user_namespace.c
> +++ b/kernel/user_namespace.c
> @@ -878,7 +878,7 @@ static bool verify_root_map(const struct file *file,
>  
>  	if (map_ns == file_ns) {
>  		/* The process unshared its ns and is writing to its own
> -		 * /proc/self/uid_map.  User already has full capabilites in
> +		 * /proc/self/uid_map.  User already has full capabilities in
>  		 * the new namespace.  Verify that the parent had CAP_SETFCAP
>  		 * when it unshared.
>  		 * */
> diff --git a/kernel/usermode_driver.c b/kernel/usermode_driver.c
> index bb7bb3b478ab..d26cfb66bb59 100644
> --- a/kernel/usermode_driver.c
> +++ b/kernel/usermode_driver.c
> @@ -54,7 +54,7 @@ static struct vfsmount *blob_to_mnt(const void *data, size_t len, const char *na
>   * umd_load_blob - Remember a blob of bytes for fork_usermode_driver
>   * @info: information about usermode driver
>   * @data: a blob of bytes that can be executed as a file
> - * @len:  The lentgh of the blob
> + * @len:  The length of the blob
>   *
>   */
>  int umd_load_blob(struct umd_info *info, const void *data, size_t len)
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 92d3bcc5a5e0..41fcb8a6f4e4 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -377,7 +377,7 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
>  
>  	/*
>  	 * Read the current timestamp first. It might become invalid anytime
> -	 * when a virtual machine is stopped by the host or when the watchog
> +	 * when a virtual machine is stopped by the host or when the watchdog
>  	 * is touched from NMI.
>  	 */
>  	now = get_timestamp();
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 50142fc08902..825d461208cc 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -524,7 +524,7 @@ static inline void debug_work_deactivate(struct work_struct *work) { }
>  #endif
>  
>  /**
> - * worker_pool_assign_id - allocate ID and assing it to @pool
> + * worker_pool_assign_id - allocate ID and assign it to @pool
>   * @pool: the pool pointer of interest
>   *
>   * Returns 0 if ID in [0, WORK_OFFQ_POOL_NONE) is allocated and assigned
> @@ -5325,7 +5325,7 @@ static int workqueue_apply_unbound_cpumask(void)
>   *  the affinity of all unbound workqueues.  This function check the @cpumask
>   *  and apply it to all unbound workqueues and updates all pwqs of them.
>   *
> - *  Retun:	0	- Success
> + *  Return:	0	- Success
>   *  		-EINVAL	- Invalid @cpumask
>   *  		-ENOMEM	- Failed to allocate memory for attrs or pwqs.
>   */


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
