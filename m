Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD524A273
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 17:05:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8Pep-0003Tw-IX
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 15:05:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiederm@xmission.com>) id 1k8Peo-0003TZ-0t
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 15:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7F9ose/rhEU8i9r4MYXW7zWx/5UiAc+uNOCADSK3kbE=; b=Fb7qPXWCuQGSIQyhnUhF0kStK
 IHC5JT6dTYfRqRI+sAFqWw+46Hzt9nKT50o8Ko1tMCAkPD7ae4NoN9vUhH4aU/4M/4UiET6i3GsxY
 RnoOoqvs1JFq14D4VMQEPrdUQHzPR0DsVN0QB+m4HxMFyyCKgllFW6YShBqpet7eGABGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7F9ose/rhEU8i9r4MYXW7zWx/5UiAc+uNOCADSK3kbE=; b=NhRp0mJBIZVTXLM5MAFMb8K3dg
 RMTVS0PwaTt6nSs73Eh08zvz2AVWcz5GWkbZ7MBhPAbrfkJ3WKnalGKllPiaDZrxtXBRPBrCGvGnK
 Jl65wQp3elFXiDdaxbF/vlootAGj7Bb/tvKWjebMNGEu6ILLoQRsyIkzQjImw05eSVNs=;
Received: from out01.mta.xmission.com ([166.70.13.231])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8Pek-00GBgt-I2
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 15:05:41 +0000
Received: from in01.mta.xmission.com ([166.70.13.51])
 by out01.mta.xmission.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1k8PeB-008bgu-Nh; Wed, 19 Aug 2020 09:05:03 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1k8Pdz-0002ES-Gb; Wed, 19 Aug 2020 09:04:58 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Christian Brauner <christian.brauner@ubuntu.com>
References: <20200818173411.404104-1-christian.brauner@ubuntu.com>
 <20200818174447.GV17456@casper.infradead.org>
 <20200819074340.GW2674@hirez.programming.kicks-ass.net>
 <20200819084556.im5zfpm2iquzvzws@wittgenstein>
 <20200819111851.GY17456@casper.infradead.org>
 <87a6yq222c.fsf@x220.int.ebiederm.org>
 <20200819134629.mvd4nupme7q2hmtz@wittgenstein>
Date: Wed, 19 Aug 2020 10:01:16 -0500
In-Reply-To: <20200819134629.mvd4nupme7q2hmtz@wittgenstein> (Christian
 Brauner's message of "Wed, 19 Aug 2020 15:46:29 +0200")
Message-ID: <87mu2qznlv.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1k8Pdz-0002ES-Gb; ; ; mid=<87mu2qznlv.fsf@x220.int.ebiederm.org>;
 ; ; hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
 frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+7Z/n5uynSvWoygLfaQ9ENNpj25p3/XJs=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=8.0 tests=ALL_TRUSTED,BAYES_40,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,T_TooManySym_03,T_TooManySym_04,XMGppyBdWords,
 XMNoVowels,XM_B_SpammyWords autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
 *      [score: 0.2682]
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  2.5 XMGppyBdWords BODY: Gappy or l33t words
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 0; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  0.2 XM_B_SpammyWords One or more commonly used spammy words
 *  0.0 T_TooManySym_04 7+ unique symbols in subject
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
X-Spam-DCC: ; sa06 0; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;Christian Brauner <christian.brauner@ubuntu.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 6658 ms - load_scoreonly_sql: 0.08 (0.0%),
 signal_user_changed: 54 (0.8%), b_tie_ro: 52 (0.8%), parse: 4.4 (0.1%),
 extract_message_metadata: 396 (5.9%), get_uri_detail_list: 51 (0.8%),
 tests_pri_-1000: 298 (4.5%), tests_pri_-950: 2.0 (0.0%),
 tests_pri_-900: 2.2 (0.0%), tests_pri_-90: 760 (11.4%), check_bayes:
 758 (11.4%), b_tokenize: 400 (6.0%), b_tok_get_all: 107 (1.6%),
 b_comp_prob: 6 (0.1%), b_tok_touch_all: 199 (3.0%), b_finish: 11
 (0.2%), tests_pri_0: 4936 (74.1%), check_dkim_signature: 3.8 (0.1%),
 check_dkim_adsp: 203 (3.0%), poll_dns_idle: 24 (0.4%), tests_pri_10:
 24 (0.4%), tests_pri_500: 112 (1.7%), rewrite_mail: 0.00 (0.0%)
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ubuntu.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [166.70.13.231 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k8Pek-00GBgt-I2
Subject: Re: [Kgdb-bugreport] [PATCH 00/11] Introduce kernel_clone(),
 kill _do_fork()
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>, linux-doc@vger.kernel.org,
 peterz@infradead.org, kgdb-bugreport@lists.sourceforge.net,
 Kars de Jong <jongk@linux-m68k.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arch@vger.kernel.org, Tom Zanussi <zanussi@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Christoph Hewllig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Christian Brauner <christian.brauner@ubuntu.com> writes:

> On Wed, Aug 19, 2020 at 08:32:59AM -0500, Eric W. Biederman wrote:
>> Matthew Wilcox <willy@infradead.org> writes:
>> 
>> > On Wed, Aug 19, 2020 at 10:45:56AM +0200, Christian Brauner wrote:
>> >> On Wed, Aug 19, 2020 at 09:43:40AM +0200, peterz@infradead.org wrote:
>> >> > On Tue, Aug 18, 2020 at 06:44:47PM +0100, Matthew Wilcox wrote:
>> >> > > On Tue, Aug 18, 2020 at 07:34:00PM +0200, Christian Brauner wrote:
>> >> > > > The only remaining function callable outside of kernel/fork.c is
>> >> > > > _do_fork(). It doesn't really follow the naming of kernel-internal
>> >> > > > syscall helpers as Christoph righly pointed out. Switch all callers and
>> >> > > > references to kernel_clone() and remove _do_fork() once and for all.
>> >> > > 
>> >> > > My only concern is around return type.  long, int, pid_t ... can we
>> >> > > choose one and stick to it?  pid_t is probably the right return type
>> >> > > within the kernel, despite the return type of clone3().  It'll save us
>> >> > > some work if we ever go through the hassle of growing pid_t beyond 31-bit.
>> >> > 
>> >> > We have at least the futex ABI restricting PID space to 30 bits.
>> >> 
>> >> Ok, looking into kernel/futex.c I see 
>> >> 
>> >> pid_t pid = uval & FUTEX_TID_MASK;
>> >> 
>> >> which is probably what this referes to and /proc/sys/kernel/threads-max
>> >> is restricted to FUTEX_TID_MASK.
>> >> 
>> >> Afaict, that doesn't block switching kernel_clone() to return pid_t. It
>> >> can't create anything > FUTEX_TID_MASK anyway without yelling EAGAIN at
>> >> userspace. But it means that _if_ we were to change the size of pid_t
>> >> we'd likely need a new futex API. 
>> >
>> > Yes, there would be a lot of work to do to increase the size of pid_t.
>> > I'd just like to not do anything to make that harder _now_.  Stick to
>> > using pid_t within the kernel.
>> 
>> Just so people are aware.  If you look in include/linux/threads.h you
>> can see that the maximum value of PID_MAX_LIMIT limits pids to 22 bits.
>> 
>> Further the design decisions of pids keeps us densly using pids.  So I
>> expect it will be a while before we even come close to using 30 bits of
>> pid space.
>
> Also because it's simply annoying to have to type really large pid
> numbers on the shell. Yes yes, that's a very privileged
> developer-centric complaint but it matters when you have to do a quick
> kill -9. Chromebook users obviously won't care about how large their
> pids are for sure.

Actually that is one of the reasons (possibly the primary reason) that
we have chosen to keep pid numbers dense.

There may be fewer users of unix shells then their used to be, and we
may now have pidfds.  But until people stop using pids in shells it is a
very valid reason to keep them densly packed.

> Tbf, related to discussions last year, systemd now actually raises the
> default limit from ~33000 to 4194304. Which seems like an ok compromise.

Intereseting.  I had not heard of that.  That seems a strange choice
for systemd rather than a system administrator to make.  Of course any
design decision that requires manual intervention to get large systems
to work is probably a bad one. 

Eric


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
