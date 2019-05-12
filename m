Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEE71AB66
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 12 May 2019 11:00:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hPkLB-0000ca-NU
	for lists+kgdb-bugreport@lfdr.de; Sun, 12 May 2019 09:00:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1hPkLA-0000cB-GP
 for kgdb-bugreport@lists.sourceforge.net; Sun, 12 May 2019 09:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j4B9AahyvgqRvxwaL6wD5cqfXHCYttglyJEYujL0qsQ=; b=iEf44XzNZ++TEAE5pCmME5Q41R
 mGCZVGTnNPMdWnZDH+WspQiArKQUaCNYXtOckfOvmJeH5silmknQ8o/Y9MiLhXFY8dcf2qLpdTkUq
 3dNmy60uNiah7A+uYrdaDowUTGv5La+s3j0eCjdAM8YFH9yfzdhq/ijNuwzJoXahc1Bg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j4B9AahyvgqRvxwaL6wD5cqfXHCYttglyJEYujL0qsQ=; b=CHRUeYYqqazLGPihN+6q4APF+Y
 WZh+cRWr7rItXEvPVsQMqcAJjzC/J0ZjmvrcxGerMWDCn4l9aEX2DdIHjzo+teqPiYn5unYM3dfI8
 qaQbCSybVy41WaeaQFMUc2hdFQEYGqhRC7HCdeL1u3a7S2TF7lb/mfxEnxwD9+q7qggc=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hPkL6-00DwRP-Kj
 for kgdb-bugreport@lists.sourceforge.net; Sun, 12 May 2019 09:00:16 +0000
Received: by mail-wr1-f68.google.com with SMTP id w8so9512724wrl.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 12 May 2019 02:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j4B9AahyvgqRvxwaL6wD5cqfXHCYttglyJEYujL0qsQ=;
 b=oU+ZcFt058u/TxK2MYqu/i0Mi722KKm6J4CTTnxt+/lczyY6tSF7dI1WSouc3NgXP2
 49TjJZB2s6CVpQsjeOLqWfhk1oxEc9u6VWYYr7bkklLRaASu5mzHwpW12PeV6ZDTV5fj
 3CmuDSeP9zOrRzKkDk7aCA1ZMe32lO/RalPYT2Xqe63aKPBVhfxuvqhFzMzETccvwuc1
 jcX+ezeZnc4Fa4bE62PYeQSKuXstJs1NkVwN06Ppi/fLuLd/fbQKjkgPZ+DQABDn+ffL
 Ckwzv1pI/HlAdS6eBtm+98Xo6W0DcW8WQrF9ASOVk0yJFsvs8ujl6dxYW+a/cCx63mOP
 h6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j4B9AahyvgqRvxwaL6wD5cqfXHCYttglyJEYujL0qsQ=;
 b=HwClPzJO/KtCGF4ue9cvsyu9k8kBLKEA2vGNmQhfE9kqTfYAwdbH7ZgqPNcY284jV1
 KhBhBJTOVWOIWOVvbR55/0p4cyCzqQk4nMinaaKwRk+umqI0d4/mVcIrzpszXUFuAOXQ
 qQLeyWwEgdwSCXeJcHNANZ2Bk81IIN39A6tIoLV4XZZGAfLA4PXn9rgLSK15Et5n1pKQ
 740nkFFtRjLPfe1Ak51eY9SyM96j5j9FzztewiVKbLKlAiCMM6dg6g8EmIlUfA2pnVAr
 wC77YlcCZBC8S1jLhRfUGmLAKVr4mPnHXWwgscE3SqytEqzaxNg8Dbg4dD60nwwxkj55
 O4EA==
X-Gm-Message-State: APjAAAWT06YNeBD8cg8FmOZNufYWB06ElzhzIsnrt9Hk3r2IyWc/fUVq
 y9zRCbQHA01c6vO9h5JiC4Wf+g==
X-Google-Smtp-Source: APXvYqyDp+8DRh3jRC8/N/1sFPEvCMjTC3q/iUoKwjrDJ2laaR0SdSTzwvWgw2C3FLL+7KEh30wRLg==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr10542788wrn.201.1557651606071; 
 Sun, 12 May 2019 02:00:06 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d14sm8310542wre.78.2019.05.12.02.00.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 12 May 2019 02:00:05 -0700 (PDT)
Date: Sun, 12 May 2019 10:00:03 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <20190512090003.de52davu55rrg7kn@wychelm.lan>
References: <1557280359-202637-1-git-send-email-wenlin.kang@windriver.com>
 <20190508081640.tvtnazr4tf5jijh7@holly.lan>
 <ac8af42c-e69d-6fd0-1d76-73a37e8a672c@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac8af42c-e69d-6fd0-1d76-73a37e8a672c@windriver.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: windriver.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hPkL6-00DwRP-Kj
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix bound check compiler warning
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
Cc: prarit@redhat.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 09, 2019 at 10:56:03AM +0800, Wenlin Kang wrote:
> On 5/8/19 4:16 PM, Daniel Thompson wrote:
> > On Wed, May 08, 2019 at 09:52:39AM +0800, Wenlin Kang wrote:
> > > The strncpy() function may leave the destination string buffer
> > > unterminated, better use strlcpy() instead.
> > > 
> > > This fixes the following warning with gcc 8.2:
> > > 
> > > kernel/debug/kdb/kdb_io.c: In function 'kdb_getstr':
> > > kernel/debug/kdb/kdb_io.c:449:3: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
> > >     strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
> > >     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> > > ---
> > >   kernel/debug/kdb/kdb_io.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > > index 6a4b414..7fd4513 100644
> > > --- a/kernel/debug/kdb/kdb_io.c
> > > +++ b/kernel/debug/kdb/kdb_io.c
> > > @@ -446,7 +446,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
> > >   char *kdb_getstr(char *buffer, size_t bufsize, const char *prompt)
> > >   {
> > >   	if (prompt && kdb_prompt_str != prompt)
> > > -		strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
> > > +		strlcpy(kdb_prompt_str, prompt, CMD_BUFLEN);
> > Shouldn't that be strscpy?
> 
> 
> Hi Daniel
> 
> I thought about strscpy, but I think strlcpy is better, because it only copy
> the real number of characters if src string less than that size.

Sorry, I'm confused by this. What behavior does strscpy() have that you
consider undesirable in this case?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
