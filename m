Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2881F248D70
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Aug 2020 19:46:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k85gc-0006pA-3i
	for lists+kgdb-bugreport@lfdr.de; Tue, 18 Aug 2020 17:46:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1k85gX-0006o0-PT
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 17:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VUwmIR+lImU3NRAfKAiYvoX2F1rNIteoEgPghMUy3n4=; b=A8qUk5v1FxnpABrr8WDtPz4Xul
 mePMBCH1FJ0jR6oY93UlfQH1attxo0LA+P25n43nu2c3GJdteZVikeVz2hZ9NO0tM3pUvt6MZnsdL
 cPJfkGNOV3L002WHjAAjHkhRsMBqoZ/fOmjr9hZH/hChY1utx9O72QgSNiy0ZcFE52Fc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VUwmIR+lImU3NRAfKAiYvoX2F1rNIteoEgPghMUy3n4=; b=C9ZHGh9S0nsVPWsA7t0P4nuFnF
 YHHzMzxSa54PjqFpx4YoTnGnAS3ysbTqn35UW4ICB9AzzgClNZYOAe2+gSnm2wZoAflFs3SzAyQhF
 oRDHvhr4QPcXKjg7teOJSIM9arKAsZFu0qSbs97gz/eHRlBpEP//vumtw+ay0VZV8Of8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k85gT-00Bdoz-1I
 for kgdb-bugreport@lists.sourceforge.net; Tue, 18 Aug 2020 17:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VUwmIR+lImU3NRAfKAiYvoX2F1rNIteoEgPghMUy3n4=; b=fICQlLgf7nqw1v5EVdw+y4UkgP
 kbIROvywOoijsDOmGkmor5zGA36mtA9nORnPdRV0+PY6SgIHRyUiYvquWKJzwh5dVSuVFAFvX3DME
 uAmwFhMRtuIsHO7AxjC/Hf6i4yUHlUCTV0VhFn4FHFVQ71s5gGsrDviphLM3xYp35OmWKPBpLVRcf
 hwpTdFcUGW3d/jWbjCTyNWqqxGNmLCqcnEhJLRysG1hkTFskpa06/7toKpSoT4Zo3bffiyMFfe8De
 fS6X/+bj0bRKlbATWH2OR/lk0NRD8TCNYrCLq21TKS0tsjdfMcrFa8oUinpiBxN298K5q3iSTGAud
 JKE97/QA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1k85fD-0006aT-In; Tue, 18 Aug 2020 17:44:47 +0000
Date: Tue, 18 Aug 2020 18:44:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200818174447.GV17456@casper.infradead.org>
References: <20200818173411.404104-1-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818173411.404104-1-christian.brauner@ubuntu.com>
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
X-Headers-End: 1k85gT-00Bdoz-1I
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

On Tue, Aug 18, 2020 at 07:34:00PM +0200, Christian Brauner wrote:
> The only remaining function callable outside of kernel/fork.c is
> _do_fork(). It doesn't really follow the naming of kernel-internal
> syscall helpers as Christoph righly pointed out. Switch all callers and
> references to kernel_clone() and remove _do_fork() once and for all.

My only concern is around return type.  long, int, pid_t ... can we
choose one and stick to it?  pid_t is probably the right return type
within the kernel, despite the return type of clone3().  It'll save us
some work if we ever go through the hassle of growing pid_t beyond 31-bit.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
