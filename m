Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6032BD035E
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Oct 2019 00:21:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHxrM-0004XZ-7D
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 22:21:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iHxrK-0004XS-SN
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 22:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ly0L4G4+dtf2vmkYamGPVXKHjeQLrnBZThMAR5CUXZE=; b=awpQI5FlDY4oVWX2Q8mQaKZBjT
 cIsnhrW141D+CvcBmFI/lpoBhen2n8Y5wc1u6kylhJNGSoaBjI2Y/MFVYqkhSMQ9J0GqWeTUJPPKg
 dsnVs4Km71+GxEf2J3Zx9U5hM8r/rc5o/YiFQ6fiySAQn6GsalH0JR0tAR+x21YUOU0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ly0L4G4+dtf2vmkYamGPVXKHjeQLrnBZThMAR5CUXZE=; b=UrZwCd6vC+SEbP9VW+BclL31jK
 GGQitAAcBi26/mIKeRvukDVvJRIQ7VZPEQfgwGrf3DDbOg0q5LjhCNCGHbS4UNSUBw+PYXWjLBWWN
 MZ+ThS4aE2iFZu9d4WIZvVq9mlz+hAtyDrfFLgbe3ECR4hK3TupMPAH+nCdlXsOc4DYc=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHxrJ-003NFv-N0
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 22:21:34 +0000
Received: by mail-io1-f68.google.com with SMTP id n197so479678iod.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 15:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ly0L4G4+dtf2vmkYamGPVXKHjeQLrnBZThMAR5CUXZE=;
 b=OiMXk0ne2OviCBwnCcqAwuZhvAFOgbQZHQR3sGMMEzWbZrLdNkmbijoAhD5cwqL+2u
 zZbnqTJ69EKGjKT0aZfynEEOhv33vLGhOpaE8ijiy3mWJG4RBmojdR2psTz25bToOdMy
 hif3B2W+eRVSn+vKav8PgTyGRKEwsmOxylUrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ly0L4G4+dtf2vmkYamGPVXKHjeQLrnBZThMAR5CUXZE=;
 b=l8d1ypqKDZVHz8ku4+0sR+5UyCFqSqetMfg2bBtoxFs0Eh/9IJepv62/nwfTOm9BUj
 eQmnwehFug5ymnyJvDwUqcCPLbA/38R5tCYnm2q5vs9BduDyWQ6MCFQ6h9lmx7dU/X9V
 GTFTzmKbkIRTb5JU/LXsbuZMTbm6XifDcGLv5RcCCIWagq6PANey9CP+yojPdIbkqU5a
 1dg9ZOH+sCYut35m8DDK7S9pg2RanZkKT7C5eDPaU1oMixxlF9F6vhbH3+gNUHYxI7JJ
 Hoe8f+myG1kQTgC3tFsqQ9QpdpoYWkbUNDv20TEx6Ji6LoqtIprh6jok9JXNgvMADr9Z
 DbLg==
X-Gm-Message-State: APjAAAV+37WhVl4+tKik845iy5FpF0fiJDg0P/8mtmXw58r9XIyPj6Y7
 02S3dOoWu9G+Gi7V+asAdGO6dShbM/8=
X-Google-Smtp-Source: APXvYqwHXZFiJDLYRcuciLSoqGf0UYIKY2wdzehKdJX8c5k1xncLL0exww4mwWfP4JTTkGZ/s/NIZw==
X-Received: by 2002:a6b:6f0b:: with SMTP id k11mr434984ioc.243.1570573287376; 
 Tue, 08 Oct 2019 15:21:27 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id h62sm257820ild.78.2019.10.08.15.21.26
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 15:21:27 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id q10so582269iop.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 15:21:26 -0700 (PDT)
X-Received: by 2002:a5e:8b0b:: with SMTP id g11mr501928iok.58.1570573286584;
 Tue, 08 Oct 2019 15:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
 <20191008132043.7966-5-daniel.thompson@linaro.org>
In-Reply-To: <20191008132043.7966-5-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 8 Oct 2019 15:21:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W008gO4HbtcSXH-uA4jyb6iJLYQJF5L++6CM0AtJmkAg@mail.gmail.com>
Message-ID: <CAD=FV=W008gO4HbtcSXH-uA4jyb6iJLYQJF5L++6CM0AtJmkAg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHxrJ-003NFv-N0
Subject: Re: [Kgdb-bugreport] [PATCH v2 4/5] kdb: Improve handling of
 characters from different input sources
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
Cc: kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Oct 8, 2019 at 6:21 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently if an escape timer is interrupted by a character from a
> different input source then the new character is discarded and the
> function returns '\e' (which will be discarded by the level above).
> It is hard to see why this would ever be the desired behaviour.

I guess the 2nd input source would be if you enable keyboard input?
Personally I've never used this myself, but your functional change
seems OK to me.


> Fix this to return the new character rather then the '\e'.

s/then/than


> This is a bigger refactor that might be expected because the new
> character needs to go through escape sequence detection.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 37 ++++++++++++++++++-------------------
>  1 file changed, 18 insertions(+), 19 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index a9e73bc9d1c3..288dd1babf90 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -122,8 +122,8 @@ static int kdb_getchar(void)
>  {
>  #define ESCAPE_UDELAY 1000
>  #define ESCAPE_DELAY (2*1000000/ESCAPE_UDELAY) /* 2 seconds worth of udelays */
> -       char escape_data[5];    /* longest vt100 escape sequence is 4 bytes */
> -       char *ped = escape_data;
> +       char buf[4];    /* longest vt100 escape sequence is 4 bytes */
> +       char *pbuf = buf;
>         int escape_delay = 0;
>         get_char_func *f, *f_escape = NULL;
>         int key;
> @@ -145,27 +145,26 @@ static int kdb_getchar(void)
>                         continue;
>                 }
>
> -               if (escape_delay == 0 && key == '\e') {
> -                       escape_delay = ESCAPE_DELAY;
> -                       ped = escape_data;
> +               /*
> +                * When the first character is received (or we get a change
> +                * input source) we set ourselves up to handle an escape
> +                * sequences (just in case).
> +                */
> +               if (f_escape != f) {
>                         f_escape = f;

Would it make sense to rename "f_escape" to "f_last" or "f_prev" now?
Essentially this logic now happens every time you change input
sources.


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
