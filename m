Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA330F9CA
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Feb 2021 18:35:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7iXI-00089d-Un
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Feb 2021 17:35:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l7iXC-000895-Bx
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 17:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5xmJVsVdWUE9F9n1Lv8bIW1y5TAc3hCeceqbQVJQ3kA=; b=B1P7OrwQWqaUDaJR3wc/mJPdFh
 zBz+duTmPvOxtlSDoz3czAPBvti2XzU63A+UAxZ+QiWvE+jn/BolUDKse9G8AR8lhx92odPBVb18T
 rhw6I2HGjPvByMqFl0JQa3xMYbc0ET+aceEpgSWokCkm7NxnRjV0GbcheIN/CT7ye9R0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5xmJVsVdWUE9F9n1Lv8bIW1y5TAc3hCeceqbQVJQ3kA=; b=EcBaW51WvVTY9VQ1gUJlYKcalG
 8rXcCFRhMzjSDFbfgaK1arQfi2Y32LCQAgx9hL6iHlaiEdPJdAoVnEq0necMYXT5ics4IG4fo6kUC
 cW9VSFEF8l32F7zI7RsjF7s0xuWa7TLg4+B1g+LCuNChMdG0Q7hDadv3hCUWzw0TAUGk=;
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l7iWy-0005N7-0y
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Feb 2021 17:35:13 +0000
Received: by mail-qt1-f178.google.com with SMTP id l23so2936184qtq.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Feb 2021 09:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5xmJVsVdWUE9F9n1Lv8bIW1y5TAc3hCeceqbQVJQ3kA=;
 b=aDxeiSQQzZ+jvYCu9zsBzOqE41xXqisDBldzgBIrkJILMT6Umm8PovVXlab75DnLcv
 rWO3S7m21IsXtB7Cqc9cADYU6bYG0/4Sa4xROWpVZ0IBAo7bTqh/FZXBasEJXw3zk25E
 kqq4wN1WBOUkfuPH3h+PJVMViJKBbIFE2LXN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5xmJVsVdWUE9F9n1Lv8bIW1y5TAc3hCeceqbQVJQ3kA=;
 b=T3gv5pE46BVeXX8YSd4TLj06M52Y/zHiSGG5XrVWWMfcmX/A9/5W9YcooMau8sMHl1
 jI8+n6Gjbz6Fuu7TyoSKTahuvUpeJM3I3fayKRUDIiNGjrwG2NGE40uN3Gci1+LU7bAY
 olBV92cxzia4vz4PXMIH/HX9yuQ9rltew1qbllv1gxxcaPBqydZPmyWvWWiwgGianSvl
 N4vMDOcM4zq186ia5xIPt+K7c5Anscw3SB1oQsc2q+iZHF2pI1QpfeRiPuEPAyFn0Tqe
 j7IngDPpacLt0rir4GPeVGvZ+DBj3cdVPmt49oZadmB1SSFNMSc9rQgT0qMp8sA+uOZO
 Dxxg==
X-Gm-Message-State: AOAM531NGnRaEF1lw1UDPQ6obzuykDX2ewaaZzXOvr9rf9rvLar8ZULG
 S0uMW97Iom3eqcb7MAV0JDw6a9FZGIcSUw==
X-Google-Smtp-Source: ABdhPJyRcdqSS9D2v3xzHJqWFuyFc1+cZVm66+I7KDZlc0cUa87YOYVdVV3UoJPXXDnLr6qiNjOx3A==
X-Received: by 2002:ac8:7546:: with SMTP id b6mr584398qtr.219.1612460093699;
 Thu, 04 Feb 2021 09:34:53 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id p17sm5356348qke.134.2021.02.04.09.34.52
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:34:52 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id m76so4016031ybf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Feb 2021 09:34:52 -0800 (PST)
X-Received: by 2002:a25:4fc3:: with SMTP id d186mr335253ybb.343.1612460092412; 
 Thu, 04 Feb 2021 09:34:52 -0800 (PST)
MIME-Version: 1.0
References: <1612433660-32661-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1612433660-32661-1-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Feb 2021 09:34:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VWq6Z7a=-JRCiggYcdekRAN9VWQnsX+03jOVFOBRi3BA@mail.gmail.com>
Message-ID: <CAD=FV=VWq6Z7a=-JRCiggYcdekRAN9VWQnsX+03jOVFOBRi3BA@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l7iWy-0005N7-0y
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Refactor env variables get/set
 code
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Feb 4, 2021 at 2:14 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Add two new kdb environment access methods as kdb_setenv() and
> kdb_printenv() in order to abstract out environment access code
> from kdb command functions.
>
> Also, replace (char *)0 with NULL as an initializer for environment
> variables array.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v2:
> - Get rid of code motion to separate kdb_env.c file.
> - Replace (char *)0 with NULL.
> - Use kernel-doc style function comments.
> - s/kdb_prienv/kdb_printenv/
>
>  kernel/debug/kdb/kdb_main.c | 166 +++++++++++++++++++++++++-------------------
>  1 file changed, 93 insertions(+), 73 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
