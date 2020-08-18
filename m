Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 504AB249A5B
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 12:28:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8LL0-0007xT-0D
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 10:28:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <christian.brauner@ubuntu.com>) id 1k85sj-00064Q-IF
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 17:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n5sO+SDfg+M/TWQL45vWVFUWW8HrAxQHNoMIrd7EZKo=; b=Nv2/0TYkQl0XjDcgMbJJD16++/
 rRGQsOOVrB2nGOHw1bXTwSJZjw50cxXUbTPkLEnlDjIMGQcK0d1RWjrgx1Ljd7ZLzk2qFK4HEa5RO
 2k4ZAw/jLSkumcWYWw6C/vWraDDbtejj5AVZWPVNxA+bN6i+v+R+G1i7PGV/eqms4p+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n5sO+SDfg+M/TWQL45vWVFUWW8HrAxQHNoMIrd7EZKo=; b=hsUpr/mR5Y7u85Nw5F9pEGKap2
 lWYXZqo0j3B8UonsAio45mZMOf0DIPwOe/49AVUH6ko/2UgFrm4tst+ZZb/onpZ+65gIH3S8j5r/q
 Y/skY56LWvY/NpXh35vNjilJRIiq4q+Aykzqs/t+aFGjcgEBg2X/FYKTNQ9hFo+JznFE=;
Received: from youngberry.canonical.com ([91.189.89.112])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-SHA:128) (Exim 4.92.2) id 1k85si-000hEX-D3
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 17:58:45 +0000
Received: from ip5f5af70b.dynamic.kabel-deutschland.de ([95.90.247.11]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1k85rt-0005EW-F5; Tue, 18 Aug 2020 17:57:53 +0000
Date: Tue, 18 Aug 2020 19:57:51 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200818175751.xg726hgyirbt354d@wittgenstein>
References: <20200818173411.404104-1-christian.brauner@ubuntu.com>
 <20200818174447.GV17456@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818174447.GV17456@casper.infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [91.189.89.112 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k85si-000hEX-D3
X-Mailman-Approved-At: Wed, 19 Aug 2020 10:28:55 +0000
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
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
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

It should be safe to switch kernel_clone() to return pid_t. (Afair, the
syscall wrappers all have "long" as return type. (I think Linus provided
some more details on that in another mail. Also see
include/linux/syscalls.h. So the return type for clone3() is really
somewhat a userspace thing, I think.)

I wonder whether I should take the opportunity and switch the advertised
flag arguments for the legacy clone() syscalls and kernel_thread() from
unsigned long to unsigned int so we can get rid of the lower
		.flags		= (lower_32_bits(clone_flags) & ~CSIGNAL),
calls I added to fix sign extension issues glibc ran into...

Christian


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
