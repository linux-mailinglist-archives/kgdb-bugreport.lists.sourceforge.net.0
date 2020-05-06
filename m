Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD4C1C781C
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 May 2020 19:38:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWO09-0005lR-H4
	for lists+kgdb-bugreport@lfdr.de; Wed, 06 May 2020 17:38:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWO04-0005l7-W2
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 May 2020 17:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8a5zVBKejAgld7VXzNaF8qHJFaoZBo2UQTEJWN0/Pas=; b=ZjZ/bdYlGmzkVvzhIf85J6JBGf
 /EgDeNAt0R7XcfphWnSYc9oXqPs745IlV02Ha3Hbqu1TqF25hSy5EJJ56mDsvhf5A+F1VFz1JAUv+
 yLnVvUJ4biHM46qsIzxU1QlaEvM+7fWWw7zXRcyR8ED96WL9B+BrjjEmeATAV3q2yLRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8a5zVBKejAgld7VXzNaF8qHJFaoZBo2UQTEJWN0/Pas=; b=VIGNZOLYEPIMKpqydBG1vDHXJO
 1tgcaWSSH3b2oElh/X5pt0NBhZFCSSMis4P9Ky4nuqoJOzfJxz2ozivG0rOq6+AOSkassP/vy2uIE
 iS1Bo7WuxRga+uga5X7j5QhTczv1eK/2bTiEmPhtWJqmawLc2A4YjlxZEuKNRhBr5EZU=;
Received: from mail-ua1-f67.google.com ([209.85.222.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWNzz-00DAQ6-27
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 May 2020 17:38:26 +0000
Received: by mail-ua1-f67.google.com with SMTP id a16so820875uaq.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 May 2020 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8a5zVBKejAgld7VXzNaF8qHJFaoZBo2UQTEJWN0/Pas=;
 b=ECGhwMJFfElWGMQN6/BzuvU4toFz9t7sCKONntpXpgyTmUVrganDLiAX/JlOezV9MQ
 v0ZNSoJ+RYvhi10KmB3EhaeHUbcH3Cdf9MmAvDRRODJ6v0moR/ADr9ynPi6ZiHninbhx
 axqnRj1QFSWECx6NxDenAzW44t5GBcDUwJa8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8a5zVBKejAgld7VXzNaF8qHJFaoZBo2UQTEJWN0/Pas=;
 b=a1uQda7zxuzB2MQTBCZPhdsWCSkuzq6zBLgMYSVZNcJRSLCZVn6nR/48dCiGMR/q6t
 465rKCodoD3N1gzsVjpc3yhIwbzu19Qb0yO4DL+Nj5yorqKnSwwWnXOekpVM/cx4g8Ba
 kYmYz9Kyo4JPKYhPI6KmP/UKaLlsWbxatATpN3Xagyc4px9ZdqCSDLzP0w9Ek2O4lXVB
 qGzY/yJs+BfYOC/E2hJ4rZMef780Uv6oCLHs+f3AlNP5vO+B//XGKKw6oTVvYE68F6Ei
 AcKGzLOlMBOYINW/1+D8bUbAByUsOEdoTV+5y/DNtZtP3+n3RFlBryQg4dZAHbVM5siT
 kfgQ==
X-Gm-Message-State: AGi0PuZjEDZSUKPJqIu8wK4jf4j+RHKWqmu8pnBca3g8j8PuGnjZntfk
 cKYEQ9a8zMIheh4ElutuWkK8fGs/OCM=
X-Google-Smtp-Source: APiQypIG1i4KARxsf6h4+7h5+4wZUW6gQjxR2FaMfHyzmS8Tt8/4Fs+ZGx7FPkfCaADEOFrc1pkI7Q==
X-Received: by 2002:a9f:310e:: with SMTP id m14mr576344uab.103.1588786689425; 
 Wed, 06 May 2020 10:38:09 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46])
 by smtp.gmail.com with ESMTPSA id l11sm1343137vkm.20.2020.05.06.10.38.08
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 10:38:08 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id l25so1563123vso.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 May 2020 10:38:08 -0700 (PDT)
X-Received: by 2002:a67:c40c:: with SMTP id c12mr8798801vsk.106.1588786687950; 
 Wed, 06 May 2020 10:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200506164223.2875760-1-daniel.thompson@linaro.org>
In-Reply-To: <20200506164223.2875760-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 May 2020 10:37:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7RjSV+dVt-AUn04bW9ZxcmQs8=OpYuXrPFx3US8yMsw@mail.gmail.com>
Message-ID: <CAD=FV=X7RjSV+dVt-AUn04bW9ZxcmQs8=OpYuXrPFx3US8yMsw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWNzz-00DAQ6-27
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix spurious true from
 in_dbg_master()
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
 Will Deacon <will@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, May 6, 2020 at 9:42 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently there is a small window where a badly timed migration could
> cause in_dbg_master() to spuriously return true. Specifically if we
> migrate to a new core after reading the processor id and the previous
> core takes a breakpoint then we will evaluate true if we read
> kgdb_active before we get the IPI to bring us to halt.
>
> Fix this by checking irqs_disabled() first. Interrupts are always
> disabled when we are executing the kgdb trap so this is an acceptable
> prerequisite. This also allows us to replace raw_smp_processor_id()
> with smp_processor_id() since the short circuit logic will prevent
> warnings from PREEMPT_DEBUG.
>
> Fixes: dcc7871128e9 ("kgdb: core changes to support kdb")
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  include/linux/kgdb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb1fd78..4d6fe87fd38f 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -323,7 +323,7 @@ extern void gdbstub_exit(int status);
>  extern int                     kgdb_single_step;
>  extern atomic_t                        kgdb_active;
>  #define in_dbg_master() \
> -       (raw_smp_processor_id() == atomic_read(&kgdb_active))
> +       (irqs_disabled() && (smp_processor_id() == atomic_read(&kgdb_active)))
>  extern bool dbg_is_early;
>  extern void __init dbg_late_init(void);
>  extern void kgdb_panic(const char *msg);

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
