Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FBB4CDC89
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  4 Mar 2022 19:32:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nQCjE-0000rS-LH
	for lists+kgdb-bugreport@lfdr.de; Fri, 04 Mar 2022 18:32:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1nQCjD-0000rL-7g
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Mar 2022 18:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ScIINym/s1zYwdre28Fn9pTUeIcuABEqsfOfpBejDew=; b=RjYfKNu5QDR2iG26squWXzY3cc
 EADEi82smwe+UiaRvyAyQWAYHJwhnzCSVSgsk+kTe/jvnV8hKfeKUD7qrwNJT135bUGCxXr+sxTI+
 XVKat2CdoMdHuATh1DU17jGWtUZIWaSGocZNkZFtADytAgiSP42A5UI8adjzLeALlj40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ScIINym/s1zYwdre28Fn9pTUeIcuABEqsfOfpBejDew=; b=M3eyu58bIbxxHrW+LLe0GsHvWN
 jAp51QJiAZ8Exma2Khum+sgGKQ/42/HxsP75tQTbBbmtEgtAvVXd/2ugHmlErUQ+gDT9YBm3jShLo
 BvbBEUJdEe0rx4eqwhj/0JyrAnA/NOs3Ciqkd7a5abqgj2aipfX8httX9SB+grHL5sWM=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nQCjA-004ydt-SQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 04 Mar 2022 18:32:33 +0000
Received: by mail-wr1-f43.google.com with SMTP id t11so13931210wrm.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 04 Mar 2022 10:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ScIINym/s1zYwdre28Fn9pTUeIcuABEqsfOfpBejDew=;
 b=gTDLuJI8Mi9+ftvhMPpwI3xkvmlECcV27R9BSVD6hXT0HmVBRR0FwwoLXYb6N1Al2i
 bK/j3t1B1Ljjq+Fc5+0SWeynkJdvwuff3j4suXxefwL460DXjznAMYUx8jShSKhXaT81
 LAKUCxOZsJQtuiy2ZURKJeOVgZdTpa69HCVI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ScIINym/s1zYwdre28Fn9pTUeIcuABEqsfOfpBejDew=;
 b=Q2zArOOMb0iXzEDaegylzYbrxzyv7ABFju17RdIjpCjPFIiHGedaGXgKq0g7OEWgDS
 TfuCZyhp2jCZymVJ6Nph2cx2JUJAHsQ2bYK/3nO1c6EseIiQjy2mcyFFyZPAcmgJtJdn
 RZMKnKovbezVXqWvkJvLIhWNXJpZKsQswA8hQ7U4QgBKhWU/7QuOPnt+d6+1bh2BW7pU
 9PDlPkvHUhD0ykDtMYbFwM9t5LojAj1JQW5RDRCTaWjF7qe4YHQIbABz2CLLJZMqXNrK
 WyM3HQJL1aLfpsG4LupApNiBrlIgXZnpX+oinwsboSCDebhTnRC1kKlFqIsVCPwS4jsA
 B4+Q==
X-Gm-Message-State: AOAM532i8YVBDUeMUMrMFv9nu7/QCkN+0JVQNErzbZl6qhwx/2dYGBOt
 JJv/Mnt5fU0W9NjjoPHgb9aUtu1lGpCD8gDu
X-Google-Smtp-Source: ABdhPJzmbFo3xfeMKDmTdoxRlMAXKp0hcX9BcjKZpEo18bLAoXPgEwI2E8JbF3sYOlQ1IEVQPRPoNQ==
X-Received: by 2002:a17:906:7304:b0:6da:9243:865 with SMTP id
 di4-20020a170906730400b006da92430865mr7392148ejc.665.1646417159832; 
 Fri, 04 Mar 2022 10:05:59 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 u19-20020aa7d893000000b00415a0f25f33sm2415505edq.34.2022.03.04.10.05.58
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 10:05:58 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id e24so842312wrc.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 04 Mar 2022 10:05:58 -0800 (PST)
X-Received: by 2002:a5d:64ed:0:b0:1f0:6672:f10c with SMTP id
 g13-20020a5d64ed000000b001f06672f10cmr4171901wri.679.1646417158156; Fri, 04
 Mar 2022 10:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20220304064324.331217-1-hasegawa-hitomi@fujitsu.com>
 <20220304064324.331217-2-hasegawa-hitomi@fujitsu.com>
In-Reply-To: <20220304064324.331217-2-hasegawa-hitomi@fujitsu.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Mar 2022 10:05:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Udf=MzyPa_o=vz=nc7ZVXBuuVNqw-VOSfrShuv0hN64Q@mail.gmail.com>
Message-ID: <CAD=FV=Udf=MzyPa_o=vz=nc7ZVXBuuVNqw-VOSfrShuv0hN64Q@mail.gmail.com>
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Thu, Mar 3,
 2022 at 10:45 PM Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
 wrote: > > void __handle_sysrq(int key, bool check_mask) > { > const struct
 sysrq_key_op *op_p; > @@ -573,6 +606,10 @@ voi [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.43 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nQCjA-004ydt-SQ
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/2] tty/sysrq: Make sysrq handler
 NMI aware
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Mar 3, 2022 at 10:45 PM Hitomi Hasegawa
<hasegawa-hitomi@fujitsu.com> wrote:
>
>  void __handle_sysrq(int key, bool check_mask)
>  {
>         const struct sysrq_key_op *op_p;
> @@ -573,6 +606,10 @@ void __handle_sysrq(int key, bool check_mask)
>         int orig_suppress_printk;
>         int i;
>
> +       /* Skip sysrq handling if one already in progress */
> +       if (sysrq_nmi_key != -1)
> +               return;

Should this give a warning?

Also, can you remind me why this is safe if two CPUs both call
handle_sysrq() at the same time? Can't both of them make it past this?
That doesn't seem so great.


> @@ -596,7 +633,13 @@ void __handle_sysrq(int key, bool check_mask)
>                 if (!check_mask || sysrq_on_mask(op_p->enable_mask)) {
>                         pr_info("%s\n", op_p->action_msg);
>                         console_loglevel = orig_log_level;
> -                       op_p->handler(key);
> +
> +                       if (in_nmi() && !op_p->nmi_safe) {
> +                               sysrq_nmi_key = key;
> +                               irq_work_queue(&sysrq_irq_work);

It looks like irq_work_queue() returns false if it fails to queue.
Maybe it's worth checking and setting "sysrq_nmi_key" back to -1 if it
fails?

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
