Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A8B17CD7
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  8 May 2019 17:09:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hOOBw-00028m-1X
	for lists+kgdb-bugreport@lfdr.de; Wed, 08 May 2019 15:09:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1hOOBu-00028O-Oo
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 May 2019 15:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A8J0qnJ8havQgpBwxndFjEeiRIL08r2bIZgoFLIonko=; b=VCn9TRUQvsFlBSwnHrnRO+onZC
 LWgcpfLS7fkte7HN/2xI7yyl3cEIWFI12szjh6zOfvn6kSvQKHsAvK9Vs54LlIxBaaUWtJBFWRzu6
 1innfPXHtK5hEt/pgWnZ+R+frVtINvjf2po4EyiOn4fc28U8V4Qtl765yhDbnB8VeeyE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A8J0qnJ8havQgpBwxndFjEeiRIL08r2bIZgoFLIonko=; b=Kn5qe/T3RtOA0Zx99UyKZJZbrN
 DTN5+yUuT+fYmdyCRXBfukRS9CFwQ8wdmMMWfQiJDITDLCgHj7aOp/RVZz6TNsHcI+j1chzn+19w8
 7mS9CZTzN2mBCLpi7fcvIFtCGfHmGS2eF5MTKX8BmrYsPsSi3MEhYM+yZMQqMkGYE9NY=;
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hOOBt-009UIF-Dg
 for kgdb-bugreport@lists.sourceforge.net; Wed, 08 May 2019 15:09:06 +0000
Received: by mail-vs1-f65.google.com with SMTP id r62so6055687vsc.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 08 May 2019 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A8J0qnJ8havQgpBwxndFjEeiRIL08r2bIZgoFLIonko=;
 b=AQf5TTC+m4D1srb6ruLAqA6thPAWsN+VeCyPcRUQz0lBwC57hkXffZhI3HYEwhtdX3
 DRdB4YCcgAnQKqb/ZUOr7e/4C0k84noZ8MC1A2386UlhROWdoQ5eFO7GkB2IMCZPG+zQ
 YHxBJXTXoujPfvUQF2cTQVxh/2oqBp2W0qPag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A8J0qnJ8havQgpBwxndFjEeiRIL08r2bIZgoFLIonko=;
 b=q9dcsaQAlqjy7By2gkRkeFdzJ/Yi/kmRcHEj31QCphs2CcnjfrlsUDKUoKuxZX1nsc
 qSLXZPcql5IFKiwgR2iB+X/XhfJ01K5lYXyyrOefaRX/MUJ1iLUpEuYDFGN+hdOGmwTa
 r3v0uhkes8FC9SImmFUblkwKibxdGHu0M3cJQOSv6ircQagmbr+68f9mLn2YQyd0iq4x
 TPfCEN5/RiEPYAw800yq5UwrnNVl8ChsyFLiOG3BXwo3ZcYECBuuAFUF0WKYDi3QbQE3
 emuu0PcJ5YQMrzo00omdBpM7Kwh1LuyHVaZZcz2yIu4XufqmdJ+R4divbsVboPNxJoXE
 hDGQ==
X-Gm-Message-State: APjAAAVPFfzgKIKd49T9L64SWNZKT0NxqU1slMmR0g5TeRvd05Py4lz9
 OwmJc5bGL7Ce66uv5guzs2KX+nEehug=
X-Google-Smtp-Source: APXvYqwPMHlcNasESRfq1jiUg8gyj9UrX2IeJWy9MV2PQNhWeWXahgWccTf50gKGaLTLvdhNfeknyQ==
X-Received: by 2002:a67:eb1a:: with SMTP id a26mr10684057vso.225.1557328138634; 
 Wed, 08 May 2019 08:08:58 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id 131sm2001028vko.44.2019.05.08.08.08.56
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 08:08:56 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id h4so7490666uaj.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 08 May 2019 08:08:56 -0700 (PDT)
X-Received: by 2002:ab0:59aa:: with SMTP id g39mr11441309uad.124.1557328136009; 
 Wed, 08 May 2019 08:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190506125018.GA13799@mwanda>
In-Reply-To: <20190506125018.GA13799@mwanda>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 May 2019 08:08:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WB=om5sPH+p0FN7i=RJfj0L+9-3YUz_djF4Nw30B221Q@mail.gmail.com>
Message-ID: <CAD=FV=WB=om5sPH+p0FN7i=RJfj0L+9-3YUz_djF4Nw30B221Q@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hOOBt-009UIF-Dg
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: do a sanity check on the cpu in
 kdb_per_cpu()
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Nicholas Mc Guire <hofrat@osadl.org>,
 kernel-janitors@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, May 6, 2019 at 5:50 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
> cpu in a bitmap of online cpus, but if the value is too high then it
> could read beyond the end of the bitmap and possibly Oops.
>
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  kernel/debug/kdb/kdb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
