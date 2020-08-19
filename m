Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBFD24A06A
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 15:47:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8ORP-0002gt-V0
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 13:47:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <christian.brauner@ubuntu.com>) id 1k8ORO-0002gW-Ma
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 13:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aBZ9PzxR1vhLNa8wtF3kUO9JtmxUTEPwOc2XXoYGIcI=; b=W8MvV22WZdsva2QqufK2l74fQW
 KeRlWlTs2ov7R6Q3XnYvRhVFeNo2rIEbTpihrZWjshjV0EEU2ANQlXxd9sKjXTNvotZie57Gjnc1i
 83ZLko8gayc+iz8GbBf+T4/G4gI4DJCZXTQWbth70lJBOnpl8tAHnqyqUo8ARQh2ZC70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aBZ9PzxR1vhLNa8wtF3kUO9JtmxUTEPwOc2XXoYGIcI=; b=hSdOOOIenHkybHDvoYjjm0ZBbq
 ZOOPsZjRfJ8LjF3Dg7M/g9/z1zko3aKIAJk6lijDnk1ZCIYslDV6UNWNv+zrC5hptyBjPnzr9BqUm
 A4K3JPwvqrWTOxY8uQ5GlYda5jXB+OXoGEGQ0UToTWybHB7ArRU2Ul7mRhdhb1i0a254=;
Received: from youngberry.canonical.com ([91.189.89.112])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA:128) (Exim 4.92.2) id 1k8ORM-001N6k-6a
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 13:47:46 +0000
Received: from ip5f5af70b.dynamic.kabel-deutschland.de ([95.90.247.11]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1k8OQB-0005pv-If; Wed, 19 Aug 2020 13:46:31 +0000
Date: Wed, 19 Aug 2020 15:46:29 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Message-ID: <20200819134629.mvd4nupme7q2hmtz@wittgenstein>
References: <20200818173411.404104-1-christian.brauner@ubuntu.com>
 <20200818174447.GV17456@casper.infradead.org>
 <20200819074340.GW2674@hirez.programming.kicks-ass.net>
 <20200819084556.im5zfpm2iquzvzws@wittgenstein>
 <20200819111851.GY17456@casper.infradead.org>
 <87a6yq222c.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a6yq222c.fsf@x220.int.ebiederm.org>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [91.189.89.112 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k8ORM-001N6k-6a
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

On Wed, Aug 19, 2020 at 08:32:59AM -0500, Eric W. Biederman wrote:
> Matthew Wilcox <willy@infradead.org> writes:
> 
> > On Wed, Aug 19, 2020 at 10:45:56AM +0200, Christian Brauner wrote:
> >> On Wed, Aug 19, 2020 at 09:43:40AM +0200, peterz@infradead.org wrote:
> >> > On Tue, Aug 18, 2020 at 06:44:47PM +0100, Matthew Wilcox wrote:
> >> > > On Tue, Aug 18, 2020 at 07:34:00PM +0200, Christian Brauner wrote:
> >> > > > The only remaining function callable outside of kernel/fork.c is
> >> > > > _do_fork(). It doesn't really follow the naming of kernel-internal
> >> > > > syscall helpers as Christoph righly pointed out. Switch all callers and
> >> > > > references to kernel_clone() and remove _do_fork() once and for all.
> >> > > 
> >> > > My only concern is around return type.  long, int, pid_t ... can we
> >> > > choose one and stick to it?  pid_t is probably the right return type
> >> > > within the kernel, despite the return type of clone3().  It'll save us
> >> > > some work if we ever go through the hassle of growing pid_t beyond 31-bit.
> >> > 
> >> > We have at least the futex ABI restricting PID space to 30 bits.
> >> 
> >> Ok, looking into kernel/futex.c I see 
> >> 
> >> pid_t pid = uval & FUTEX_TID_MASK;
> >> 
> >> which is probably what this referes to and /proc/sys/kernel/threads-max
> >> is restricted to FUTEX_TID_MASK.
> >> 
> >> Afaict, that doesn't block switching kernel_clone() to return pid_t. It
> >> can't create anything > FUTEX_TID_MASK anyway without yelling EAGAIN at
> >> userspace. But it means that _if_ we were to change the size of pid_t
> >> we'd likely need a new futex API. 
> >
> > Yes, there would be a lot of work to do to increase the size of pid_t.
> > I'd just like to not do anything to make that harder _now_.  Stick to
> > using pid_t within the kernel.
> 
> Just so people are aware.  If you look in include/linux/threads.h you
> can see that the maximum value of PID_MAX_LIMIT limits pids to 22 bits.
> 
> Further the design decisions of pids keeps us densly using pids.  So I
> expect it will be a while before we even come close to using 30 bits of
> pid space.

Also because it's simply annoying to have to type really large pid
numbers on the shell. Yes yes, that's a very privileged
developer-centric complaint but it matters when you have to do a quick
kill -9. Chromebook users obviously won't care about how large their
pids are for sure.

Tbf, related to discussions last year, systemd now actually raises the
default limit from ~33000 to 4194304. Which seems like an ok compromise.

Christian


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
