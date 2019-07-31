Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA687C562
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 31 Jul 2019 16:52:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hspyC-0006It-2T
	for lists+kgdb-bugreport@lfdr.de; Wed, 31 Jul 2019 14:52:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jan.kiszka@siemens.com>) id 1hspyA-0006Ih-No
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 14:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C0j6LRjSOXclU2ISf0TVnSPk4tF629F4eS5htnIxM4s=; b=TJ9/bMxDFy/ijuzcskpQ6wcMbg
 eLCWaXXY2sJOGRfJ8NOQkhWtHR/mtG9w3HGkg8apnjioVehq7DHxsHgNXGaPahPeDuNvCxrI7lA7i
 Z9YMjJQmo5sGjnIC0wSgNJPYALTq4a0d963c0B2kTQVDyRrY/sONyYJwgkulUJ5zxM50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C0j6LRjSOXclU2ISf0TVnSPk4tF629F4eS5htnIxM4s=; b=e+wNzHhJc5Rs0xpYhmgG49gWxw
 knyddeQo70gm70/gBCTCPDd0kb7JGcbMHEvllEAiBpRL4my/I1STrMxc1iA7Q1NWpu5j/EWPzPu7S
 aTwpcNtNnRTsCEhPjSOmvxKXKCop7KkM06ifv9IaowDZL+ptuhxoV4PcGYjo5nH1EYuU=;
Received: from goliath.siemens.de ([192.35.17.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hspy7-003QDm-RX
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 14:52:46 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6VEOTva024755
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 16:24:30 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may
 be forged))
 by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6VEOTdf027880;
 Wed, 31 Jul 2019 16:24:29 +0200
To: Douglas Anderson <dianders@chromium.org>,
 Kieran Bingham <kbingham@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20190730234052.148744-1-dianders@chromium.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <34bbd6b5-2e37-159a-b75b-36a6be11c506@siemens.com>
Date: Wed, 31 Jul 2019 16:24:28 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190730234052.148744-1-dianders@chromium.org>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: symbols.py]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hspy7-003QDm-RX
Subject: Re: [Kgdb-bugreport] [PATCH] scripts/gdb: Handle split debug
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
 Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 31.07.19 01:40, Douglas Anderson wrote:
> Some systems (like Chrome OS) may use "split debug" for kernel
> modules.  That means that the debug symbols are in a different file
> than the main elf file.  Let's handle that by also searching for debug
> symbols that end in ".ko.debug".

Is this split-up depending on additional kernel patches, is this already
possible with mainline, or is this purely a packaging topic? Wondering because
of testability in case it's downstream-only.

Jan

> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  scripts/gdb/linux/symbols.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
> index 2f5b95f09fa0..34e40e96dee2 100644
> --- a/scripts/gdb/linux/symbols.py
> +++ b/scripts/gdb/linux/symbols.py
> @@ -77,12 +77,12 @@ lx-symbols command."""
>              gdb.write("scanning for modules in {0}\n".format(path))
>              for root, dirs, files in os.walk(path):
>                  for name in files:
> -                    if name.endswith(".ko"):
> +                    if name.endswith(".ko") or name.endswith(".ko.debug"):
>                          self.module_files.append(root + "/" + name)
>          self.module_files_updated = True
>  
>      def _get_module_file(self, module_name):
> -        module_pattern = ".*/{0}\.ko$".format(
> +        module_pattern = ".*/{0}\.ko(?:.debug)?$".format(
>              module_name.replace("_", r"[_\-]"))
>          for name in self.module_files:
>              if re.match(module_pattern, name) and os.path.exists(name):
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
