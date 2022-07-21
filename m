Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B1057D2B0
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 21 Jul 2022 19:42:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oEaBo-0003E5-JO
	for lists+kgdb-bugreport@lfdr.de; Thu, 21 Jul 2022 17:42:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1oEaBm-0003Dy-JS
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 Jul 2022 17:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RhI3VCUzNHo5JklMmIqECqYQ6SyTPpDz3EAd2IXpnCc=; b=EpdIXuWIq1Yp/5HEtFD4TsTmqu
 9DLQv5x3K3xBL+wTIw5AkTpI2Ig/9BO8dfdZRJrelLnKDCgcFvdk+4McYYBFUxj1U8hG5I8vHFcNU
 DFNJwsMv3JV4T+xR1emcr8xjQNLMI6A5DqQ3kPs4bUN1QoJlQ/gqaYTQYauO44/3FteE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RhI3VCUzNHo5JklMmIqECqYQ6SyTPpDz3EAd2IXpnCc=; b=NIAVkugpdcDrIceTB/hjsyq6jb
 izdbBOTsdC4ExaNx6nmUtuP3QtQP5Cat50of8GkElUsHTIP7QUu99HwKK5XlW5shZqrxtzAUeffEN
 2ExlpniuyazxZyy7xVLk1GOpZUOmfudgWK9FpD9Gq38LRkjUGdZiVYC5WTYg4CxkxeeQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEaBl-0068j7-Su
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 Jul 2022 17:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RhI3VCUzNHo5JklMmIqECqYQ6SyTPpDz3EAd2IXpnCc=; b=BBkvMnqQohd6YdtIM+p3u0mFPe
 E/h4AwZ7lEA/5Y8xtvIbzGvgnsQ+FNj4guVIegorCmbP5MBFp1kHxpemTERABuEqZ4J+T6nTXOP8r
 +zbgnboMaloQK6Jsb7IZMCf9fOJTn6xqhdyJHHC6fwJldazzKn5eN8AQlq8OKBOXxub0DtA13WpkP
 KMesSlG1Jiv3g7WQ9MkfnGGeOYl6POj7vOHgXKsJtpeI5YiIu/gqrCmn+9Ilr8CN85BUybrBHmFcN
 HpiYvHrU2IZfWFiAwCFzhy5BLLobYnR+0MAa4ELRT5DniZYFouSXRoEXrQLvT6GQ86CmgER+dYAtI
 aHKs3d0A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1oEZ6s-00A2Mo-7j; Thu, 21 Jul 2022 16:33:10 +0000
Date: Thu, 21 Jul 2022 09:33:10 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Doug Anderson <dianders@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Ytl/xkb9OC43dgJd@bombadil.infradead.org>
References: <20220721093042.9840-1-khalid.masum.92@gmail.com>
 <CAD=FV=UbRX194rDztr_=eoALg4kTmjzq=EXCX6RJSSq3vO=fbw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UbRX194rDztr_=eoALg4kTmjzq=EXCX6RJSSq3vO=fbw@mail.gmail.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 21, 2022 at 09:24:31AM -0700,
 Doug Anderson wrote: > Hi, > > On Thu, Jul 21,
 2022 at 2:31 AM Khalid Masum <khalid.masum.92@gmail.com>
 wrote: > > > > Currently the command 'lx-symbols' in g [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1oEaBl-0068j7-Su
Subject: Re: [Kgdb-bugreport] [PATCH RESEND] scripts/gdb: Fix gdb
 'lx-symbols' command
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
Cc: Khalid Masum <khalid.masum.92@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, Aaron Tomlin <atomlin@redhat.com>,
 Kieran Bingham <kbingham@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Jan Kiszka <jan.kiszka@siemens.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kgdb-bugreport@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jul 21, 2022 at 09:24:31AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jul 21, 2022 at 2:31 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
> >
> > Currently the command 'lx-symbols' in gdb exits with the error`Function
> > "do_init_module" not defined in "kernel/module.c"`. This occurs because
> > the file kernel/module.c was moved to kernel/module/main.c.
> >
> > Fix this breakage by changing the path to "kernel/module/main.c" in
> > LoadModuleBreakpoint.
> >
> > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> > ---
> >  scripts/gdb/linux/symbols.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
> > index 46f7542db08c..dc07b6d12e30 100644
> > --- a/scripts/gdb/linux/symbols.py
> > +++ b/scripts/gdb/linux/symbols.py
> > @@ -180,7 +180,7 @@ lx-symbols command."""
> >                  self.breakpoint.delete()
> >                  self.breakpoint = None
> >              self.breakpoint = LoadModuleBreakpoint(
> > -                "kernel/module.c:do_init_module", self)
> > +                "kernel/module/main.c:do_init_module", self)
> 
> Fixes: cfc1d277891e ("module: Move all into module/")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

This should go to Linus prior to the next rc.  Linus, I think this is
with picking up now as I smell a final release soon.

FWIW a git grep of "kernel/module\.c" reveals no other code users of
this path.

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
