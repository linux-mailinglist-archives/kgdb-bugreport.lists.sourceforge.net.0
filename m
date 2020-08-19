Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E646249B98
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 13:20:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8M8b-0006Tc-Eo
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 11:20:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1k8M8Z-0006T4-2l
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 11:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S3ViV7VOxKoiTfVgrvw4ZTEB3xmhm4rVfkGYugjh9Xc=; b=cnakQKsra7VQhnddLugAOng4uO
 /XxYlFzr5LRib6usqCBu9jC5kRww8ILTY2me5wWSO7FcQXGTK8NcRXzZBw/E/qQplFeempgzJGwvp
 jlDEq3F7RycFOezvBwdiqk8qmE8mVIbf7wvlph5EFvZPCMzxkoSqdNaTxORYIvamNyXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S3ViV7VOxKoiTfVgrvw4ZTEB3xmhm4rVfkGYugjh9Xc=; b=dRY8oV7P6+3T9u9cTHzYLV1doP
 5NP2dKLVuU/JC1q+qa/DTdoKZCwv2YPM8feYCcvB7n7U6xPd3q/PRHbg2aT8Kad6QkfcAaoXzVDVg
 PtJJePfREoSKD545IIUQYVvc/oeDsR+XZigsSBSo9mMCaoPkzyUlSzcGuk90gxra5JX0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8M8V-00CKIB-Ea
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 11:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S3ViV7VOxKoiTfVgrvw4ZTEB3xmhm4rVfkGYugjh9Xc=; b=PqH95VsKVPNJwI5a/Er+qYg1YE
 2cP0Ceuh2EDSbznFUi6KCJU7M7Tnu1YxtinWU5IogRZ5X49Svh2ING9dG/X8+rguc0s8CNSZJSVjz
 sraZ7CGNbsDhWzRg8+UC6yH+tcPq9EXMZaDIgh2vnz9pMYTUAJGAn4dbA7FDtXtyG0dgROnOxjecF
 HOVDUZCBr76yq9h8gCFemMaMo2+mPHghmOxYz2YkVf+ANSqWMa0srF34jYala3pRYzPD19EoNJfdq
 Ood3xlpgoQ1+iBy6EacDpMR9Obz0ZXPuj8jDYzWyRwFWRGHSlTe43zBy51TCIlPCVr09ikGje2dIK
 +jtFq6ig==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1k8M7H-00015G-Od; Wed, 19 Aug 2020 11:18:51 +0000
Date: Wed, 19 Aug 2020 12:18:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200819111851.GY17456@casper.infradead.org>
References: <20200818173411.404104-1-christian.brauner@ubuntu.com>
 <20200818174447.GV17456@casper.infradead.org>
 <20200819074340.GW2674@hirez.programming.kicks-ass.net>
 <20200819084556.im5zfpm2iquzvzws@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819084556.im5zfpm2iquzvzws@wittgenstein>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k8M8V-00CKIB-Ea
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
 Kars de Jong <jongk@linux-m68k.org>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org,
 Tom Zanussi <zanussi@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hewllig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, uclinux-h8-devel@lists.sourceforge.jp,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Aug 19, 2020 at 10:45:56AM +0200, Christian Brauner wrote:
> On Wed, Aug 19, 2020 at 09:43:40AM +0200, peterz@infradead.org wrote:
> > On Tue, Aug 18, 2020 at 06:44:47PM +0100, Matthew Wilcox wrote:
> > > On Tue, Aug 18, 2020 at 07:34:00PM +0200, Christian Brauner wrote:
> > > > The only remaining function callable outside of kernel/fork.c is
> > > > _do_fork(). It doesn't really follow the naming of kernel-internal
> > > > syscall helpers as Christoph righly pointed out. Switch all callers and
> > > > references to kernel_clone() and remove _do_fork() once and for all.
> > > 
> > > My only concern is around return type.  long, int, pid_t ... can we
> > > choose one and stick to it?  pid_t is probably the right return type
> > > within the kernel, despite the return type of clone3().  It'll save us
> > > some work if we ever go through the hassle of growing pid_t beyond 31-bit.
> > 
> > We have at least the futex ABI restricting PID space to 30 bits.
> 
> Ok, looking into kernel/futex.c I see 
> 
> pid_t pid = uval & FUTEX_TID_MASK;
> 
> which is probably what this referes to and /proc/sys/kernel/threads-max
> is restricted to FUTEX_TID_MASK.
> 
> Afaict, that doesn't block switching kernel_clone() to return pid_t. It
> can't create anything > FUTEX_TID_MASK anyway without yelling EAGAIN at
> userspace. But it means that _if_ we were to change the size of pid_t
> we'd likely need a new futex API. 

Yes, there would be a lot of work to do to increase the size of pid_t.
I'd just like to not do anything to make that harder _now_.  Stick to
using pid_t within the kernel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
