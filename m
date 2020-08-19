Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A28B24A405
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 19 Aug 2020 18:25:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k8Qtf-0001Mg-Sp
	for lists+kgdb-bugreport@lfdr.de; Wed, 19 Aug 2020 16:25:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1k8Qte-0001Ma-Vy
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 16:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0qj0NgMXE9N5E+k0q9ljNMUsiRWKFkmPnIi16FDMGEc=; b=NqrmtCFSoi7Po746ksR6HYo0e4
 2EpXygqzFA/z1mzkUSEPlR6qBVWo/jUy/YslPFJ309dHEojYfWwED5AU8eUYAafsPPHkhlRmcRes1
 3U0yeUr0vY0wme6xv2aN1NRpAVyD+MPozNeK5yFg5pEpxphCmjyOufkoq3slfI2Znx8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0qj0NgMXE9N5E+k0q9ljNMUsiRWKFkmPnIi16FDMGEc=; b=MKatlohCnwkigoRTWy1bJAew7y
 6hjlixW0Z9+nIhXQP72z5iQdOKBg9GhFLi2diLfWLueovxqTe/4shK5OFkczhYxLunHaug7iXTyDK
 8ha6/sI9NoD4ngbUUbvkBvnIu0JA2swUvXRxe62oWy3KMht/EdZbgPDkkj/LKfIgEJtM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8Qtd-00CYCu-1i
 for kgdb-bugreport@lists.sourceforge.net; Wed, 19 Aug 2020 16:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0qj0NgMXE9N5E+k0q9ljNMUsiRWKFkmPnIi16FDMGEc=; b=HlZ9h/mQIGWHSczZdWzzLw8l+9
 Jb7IErUxYlL78RPZ71SMSGS/HV3yVvuUiIK/YrwfyvTC10O8KcRT6VMnYVL0aU6CO/PcKoxUKjbEg
 FMPh3GoEkEasFRBXmnoogUTGVM8X1nLXrNJ16FeiPqu6ZKF55STetGuo6F7oJDkb7OFe+PK4ovJbA
 LbxobzPdOK8V+J3D2xXSgj1M/Gi/FLJ8k0qHIh30NkHE5oScUHkA9+e2lUTAXyQG8c7I3ipBoYqQG
 U0zEH7NCWDF7DOH+DTnpfm8m7ACzQHtRlw8IFMlAy1bIPMlB4/FKC98szZaxVo3aceR5NEss3m70T
 PvKLLcqw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1k8Qsd-0004c3-7w; Wed, 19 Aug 2020 16:24:03 +0000
Date: Wed, 19 Aug 2020 17:24:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Message-ID: <20200819162403.GF17456@casper.infradead.org>
References: <20200818174447.GV17456@casper.infradead.org>
 <20200819074340.GW2674@hirez.programming.kicks-ass.net>
 <20200819084556.im5zfpm2iquzvzws@wittgenstein>
 <20200819111851.GY17456@casper.infradead.org>
 <87a6yq222c.fsf@x220.int.ebiederm.org>
 <20200819134629.mvd4nupme7q2hmtz@wittgenstein>
 <87mu2qznlv.fsf@x220.int.ebiederm.org>
 <df7f7e17a730405ea182ec778eec22e1@AcuMS.aculab.com>
 <20200819154521.GE17456@casper.infradead.org>
 <ee30fecfbd534c19a6bfd11d2c4b8263@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee30fecfbd534c19a6bfd11d2c4b8263@AcuMS.aculab.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k8Qtd-00CYCu-1i
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Kars de Jong <jongk@linux-m68k.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Stafford Horne <shorne@gmail.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Tom Zanussi <zanussi@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christoph Hewllig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "uclinux-h8-devel@lists.sourceforge.jp"
 <uclinux-h8-devel@lists.sourceforge.jp>, Fenghua Yu <fenghua.yu@intel.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Tony Luck <tony.luck@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "'Eric W. Biederman'" <ebiederm@xmission.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Aug 19, 2020 at 03:55:47PM +0000, David Laight wrote:
> From: Matthew Wilcox
> > Sent: 19 August 2020 16:45
> > 
> > On Wed, Aug 19, 2020 at 03:41:48PM +0000, David Laight wrote:
> > > Does linux have an O(1) (or do I mean o(1)) pid allocator?
> > > Or does it have to do a linear scan to find a gap??
> > 
> > O(log(n)).  It uses the IDR allocator, so 'n' in this case is the
> > number of PIDs currently allocated, and it's log_64 rather than log_2
> > (which makes no difference to O() but does make a bit of a difference
> > to performance)
> 
> Still worse that O(1) - when that is just replacing a variable
> with a value read out of an array.
> Made pid lookup a trivial O(1) as well.

You'd be surprised.  We replaced the custom PID allocator with the
generic IDR allocator a few years ago and got a pretty decent speedup.

If you think you can do better, then submit patches.  You have to support
all the existing use cases, of course.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
