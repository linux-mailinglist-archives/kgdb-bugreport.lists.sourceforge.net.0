Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26155BABAF
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 22 Sep 2019 22:29:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iC8Tk-0004bO-UY
	for lists+kgdb-bugreport@lfdr.de; Sun, 22 Sep 2019 20:29:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <will@kernel.org>) id 1iC8Tk-0004bC-0p
 for kgdb-bugreport@lists.sourceforge.net; Sun, 22 Sep 2019 20:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P+qfe5zI4xQtxVqZPvnQRMKq++VM0CkHKn4wwy7ubqU=; b=mD5MJcELYNp7rCOOwoJTxCtitu
 8yf829W7k9QGfz3WqlDfHJaXCfhMHo6FP2meiJLc6u4rnafe3waTs4shDeqbTR1ja/98ELDJbBXBX
 Uul4geJpnvanS1vTErrsYcH6BylOUbF97rZQPP00dBPT10g3/72xxQZpxRJ2nZBvLyk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P+qfe5zI4xQtxVqZPvnQRMKq++VM0CkHKn4wwy7ubqU=; b=JoNk5ZBgZ8HBPR77KrIXPeWk4h
 nxBa/Qd45rUqFnLWow/I6RKHP7CUPvl8yc7HRudyd6KkEwEi5Ekjrk5Y2LKt3K7MpgGkhWti6eAyL
 kDJfe/KzU/rxNXD6cH4VAg3U4UyF/e5qD/8j/z3yyYSdHm4Caruf5evtvMeTjaJ0qwjA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iC8Te-00482r-TW
 for kgdb-bugreport@lists.sourceforge.net; Sun, 22 Sep 2019 20:29:07 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C56620644;
 Sun, 22 Sep 2019 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569184132;
 bh=aNmux5WskQasXL3W5fSP8ZeWxPMhq3DVtOInr703h6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=grEjxYiaui+8pzlJzi4Uxw9wBu+cJ7hfHMnmlrjZ/rOTd9eIlDw4z7lkn1YCyANJF
 gbm4oy3c9/bRzjwckCvg8YQka0iTqlVECGOUBs2h1SdQlJWQiGvcYoR7hlAmIJNbH9
 jvPihnmlinAqdtJmr6Yvk7HAHDVahns74+xtV11U=
Date: Sun, 22 Sep 2019 21:28:47 +0100
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20190922202846.n2gtdkio6ygu6mhn@willie-the-truck>
References: <20190920104404.1.I237e68e8825e2d6ac26f8e847f521fe2fcc3705a@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920104404.1.I237e68e8825e2d6ac26f8e847f521fe2fcc3705a@changeid>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iC8Te-00482r-TW
Subject: Re: [Kgdb-bugreport] [PATCH] MAINTAINERS: kgdb: Add myself as a
 reviewer for kgdb/kdb
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Rob Herring <robh@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Linus Walleij <linus.walleij@linaro.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Sep 20, 2019 at 10:44:47AM -0700, Douglas Anderson wrote:
> I'm interested in kdb / kgdb and have sent various fixes over the
> years.  I'd like to get CCed on patches so I can be aware of them and
> also help review.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c740cf3f93ef..d243c70fc8ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9052,6 +9052,7 @@ F:	security/keys/
>  KGDB / KDB /debug_core
>  M:	Jason Wessel <jason.wessel@windriver.com>
>  M:	Daniel Thompson <daniel.thompson@linaro.org>
> +R:	Douglas Anderson <dianders@chromium.org>
>  W:	http://kgdb.wiki.kernel.org/
>  L:	kgdb-bugreport@lists.sourceforge.net
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jwessel/kgdb.git

Acked-by: Will Deacon <will@kernel.org>

I really wanted to rip kgdb out of arm64 a while ago and you stopped me, so
you deserve to have your name in lights ;)

Thanks.

Will


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
