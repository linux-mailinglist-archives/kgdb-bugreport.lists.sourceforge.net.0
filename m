Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611A1B7FAB
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Apr 2020 22:02:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jS4XJ-0006jY-B3
	for lists+kgdb-bugreport@lfdr.de; Fri, 24 Apr 2020 20:02:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jS4XI-0006jM-3Z
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 20:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IyAAaOwFK7ul7d9czQcmoPsUFdvkN9A5K/n4TydUE7s=; b=DgLz+ekAMXyUeFex0oqWFAtc4C
 HSkLL81dB4issxL7EtPzfhVOKHxFHcezHcE9SeaUpmoM8WNkddixxNd3ce/ZnUxaC9f9oG9TjFdLQ
 wf7TCukCxwat3bvJ7SYOPwFJ4BftoWiIC/6sL1ZjdLe1o3RkHskD8nWds8wyaO0baUsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IyAAaOwFK7ul7d9czQcmoPsUFdvkN9A5K/n4TydUE7s=; b=VYb6RRoovKKgzoRuAPsWQAem3y
 N8Hd0/bh8cALf5uunOBhmOHvrwkDyeuKC2EooTgoL0dlacFlBVfcz1lNXa9K0X2e+TnKcy79tP4wP
 IbTSm/7Wv5ErvGtYSFcTvJCwx1boM0M3C7xt3uiIl1Wa0pU0b1ijZXCYZt6AUPTm4a2E=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jS4XE-00DBms-K2
 for kgdb-bugreport@lists.sourceforge.net; Fri, 24 Apr 2020 20:02:56 +0000
Received: by mail-pf1-f196.google.com with SMTP id z1so3624291pfn.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 13:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IyAAaOwFK7ul7d9czQcmoPsUFdvkN9A5K/n4TydUE7s=;
 b=PF+kY+n18N6Y8sxBrsgfpMsiJrDvPdLp7v6zKmnMnR+nF9jYyMmXusEJ65ZmgOTgo7
 jaIYJG5iBR3nlo17YckUo9KEvEJsZ4SQDkGJbHsPinLM670SN8oDB5nrrstzmRzRoLGx
 URl+TGalt+yIGIzbDtOZv8ZfmyO19a4tV2XLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IyAAaOwFK7ul7d9czQcmoPsUFdvkN9A5K/n4TydUE7s=;
 b=Jp7rIInIR0rbUwSnmfTQumPunyBDKAxrvHihKilS0jh1Mfs6rVPCuDjIdxacc3fWOi
 bS4EmfxLIKvog4pcNo6BF9nVLZNSOdsqy9YBD+uijVX/rw2bG1Bx+TJBgCzuMf2ZSznF
 sy2h59QBe0HlPgc1hB8lkg/KT/411o5WV0TOnbJv83wO7MaBYjii78XPJKRSxjN2jJDu
 1cyBa2EvvZIwDJ2C3gAp+AUjMJ6ciWY9gC7l0iSEXbVhMVMn3VMoIjkWqqEZLT1PDEnL
 io/3zvLdmzsLgEYMRZ+2pAWlOMHAyEQX+sMkSkZE22jBdcWA/Tv5byTFDyvLw4nW89H1
 xWzw==
X-Gm-Message-State: AGi0PuZURdi1VwBBHj3tAe6P+JJm8SuhATAmAkO6FCpHF/pvcWNjKKF/
 4AF+k49+nGxVj1jXb9bTFA7NBZ/bAio=
X-Google-Smtp-Source: APiQypJg+nSVINrfawYmrdEiLjKlUxbF57bFVLLaHnle0lIi/6koj0K3lTFkyU05QHjZhKeeyacJqA==
X-Received: by 2002:a1f:31cf:: with SMTP id x198mr9450364vkx.101.1587752295615; 
 Fri, 24 Apr 2020 11:18:15 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id l197sm1759563vke.30.2020.04.24.11.18.12
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 11:18:13 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id s5so10438492uad.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Apr 2020 11:18:12 -0700 (PDT)
X-Received: by 2002:ab0:b88:: with SMTP id c8mr8784752uak.0.1587752291944;
 Fri, 24 Apr 2020 11:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <1587716031-28199-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1587716031-28199-1-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Apr 2020 11:17:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X8NY+3pECsF27SC80FQmzewJ1gSs48wzB=PTYRZ4pCaA@mail.gmail.com>
Message-ID: <CAD=FV=X8NY+3pECsF27SC80FQmzewJ1gSs48wzB=PTYRZ4pCaA@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jS4XE-00DBms-K2
Subject: Re: [Kgdb-bugreport] [PATCH] serial: amba-pl011: Support
 earlycon_kgdboc
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Apr 24, 2020 at 1:15 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Implement the read() function in the early console driver. With
> recently added earlycon_kgdboc feature, this allows you to use kgdb
> to debug fairly early into the system boot.
>
> We only bother implementing this if polling is enabled since kgdb can't
> be enabled without that.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Depends on kgdb patch series: https://lkml.org/lkml/2020/4/21/1179
>
>  drivers/tty/serial/amba-pl011.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

This is the first time I've ever looked at the code for this
particular serial driver, but with that caveat your patch looks right
to me.  Specifically:

* Code, naming, and style of your new read routine match the existing
write routine used for earlycon.

* The read routine looks to read the same registers / works the same
as the main "polling" read routine, pl011_get_poll_char().

Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
