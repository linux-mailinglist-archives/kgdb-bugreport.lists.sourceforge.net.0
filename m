Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 020862497A3
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 09:44:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8Im4-0002PM-QU
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 07:44:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <peterz@infradead.org>) id 1k8Im1-0002PC-II
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 07:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J4VLIDE+jMck3vXa9rHkkbq93VX4dA7h042aAl3zgek=; b=GrG5jI/8EASZiMCukazgpvPgfu
 BdK2q8ENuhp2TM8i4eSQuKzm/TACgpsv3h8eqP9uQgO1YEN8oixfM1StFAJG84+F0/Ff70zZTWRnM
 AhIe3JG66ECjBfbjER/MfU+9nJnlZQI9FmWo+KL+NkPaqTzUhzCFlvmNSWE5wdGo8Qq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J4VLIDE+jMck3vXa9rHkkbq93VX4dA7h042aAl3zgek=; b=eFLBkUf+YnGUtzSL1AixNytgnN
 OrduDYgoQr23a4qhSNIm8yyEWzZ9+IHu2HxyAyAhfaFJ8jFoOZIDthtnz4yd8pApVQabf+k/Zt1cZ
 x43K2Ej/mJ6gF8pFgP7tJqvqRVhRgNhIy750zosy5Kv+CWFPaslVNf73alW2tom8mTj8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8Ilv-0017Jb-Ur
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 07:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=J4VLIDE+jMck3vXa9rHkkbq93VX4dA7h042aAl3zgek=; b=GSbjxZPVDWY9S2GcrIk8B4gIZK
 j92/xIYVxtuoQcdVQihAza5CL3O+d/4dVnYCOtqcw95X6MI1MCZZSH6hwnnNv59Rv6M/0DxxfI85Z
 UetDLZWdWsUi0gxQgyvX8fGCj5GmxgkNMNSwgrePOzzo081IyNCOy8gMqm/f6tWnpCOgk7R6crldh
 OlQrG9icVQmb7q55F07IEfNtZO5gIevhdDF5gCkOdzt7019673F7x8Bn8IOD8fbZrRBUSRYhjoZpr
 mvZYw/yBuHHrZ3B/X+3SaSMawrw2fW9khhY7o7saT7DmXZNOoFnK3Bqb3KZy6UsHyVp/CwyDsiZsC
 KS6aDo8Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Il4-0004Sk-Ty; Wed, 19 Aug 2020 07:43:44 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 033743003E1;
 Wed, 19 Aug 2020 09:43:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D771C21A87267; Wed, 19 Aug 2020 09:43:40 +0200 (CEST)
Date: Wed, 19 Aug 2020 09:43:40 +0200
From: peterz@infradead.org
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200819074340.GW2674@hirez.programming.kicks-ass.net>
References: <20200818173411.404104-1-christian.brauner@ubuntu.com>
 <20200818174447.GV17456@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818174447.GV17456@casper.infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k8Ilv-0017Jb-Ur
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
 kgdb-bugreport@lists.sourceforge.net, Kars de Jong <jongk@linux-m68k.org>,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-ia64@vger.kernel.org, Christian Brauner <christian.brauner@ubuntu.com>,
 Stafford Horne <shorne@gmail.com>, linux-arch@vger.kernel.org,
 Tom Zanussi <zanussi@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hewllig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, uclinux-h8-devel@lists.sourceforge.jp,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Aug 18, 2020 at 06:44:47PM +0100, Matthew Wilcox wrote:
> On Tue, Aug 18, 2020 at 07:34:00PM +0200, Christian Brauner wrote:
> > The only remaining function callable outside of kernel/fork.c is
> > _do_fork(). It doesn't really follow the naming of kernel-internal
> > syscall helpers as Christoph righly pointed out. Switch all callers and
> > references to kernel_clone() and remove _do_fork() once and for all.
> 
> My only concern is around return type.  long, int, pid_t ... can we
> choose one and stick to it?  pid_t is probably the right return type
> within the kernel, despite the return type of clone3().  It'll save us
> some work if we ever go through the hassle of growing pid_t beyond 31-bit.

We have at least the futex ABI restricting PID space to 30 bits.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
