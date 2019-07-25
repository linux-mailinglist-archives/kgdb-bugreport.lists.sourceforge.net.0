Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A44F974DCE
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 25 Jul 2019 14:10:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hqca6-00011H-No
	for lists+kgdb-bugreport@lfdr.de; Thu, 25 Jul 2019 12:10:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <xywang.sjtu@sjtu.edu.cn>) id 1hqca5-00010v-Lo
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Jul 2019 12:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dNTqWyVvjmPUjvucFscXMpK34gQ6puG0R56XX12hDDI=; b=SL5+41qHQqSiSHPZtp/tcDZv3t
 zAYkKKELB05GM2UnmLxdw0emF3ZzQuwScuV4wWnF0yQ/GtYOg3v9RIVTMSlWoIZk1c4eNZcaA8IOk
 o+UWiwheQy43wHH9feqrGnlNkvjkEANZajJftdXNJvdSOi34TnjCmyc/3Hr3b4vi8vFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dNTqWyVvjmPUjvucFscXMpK34gQ6puG0R56XX12hDDI=; b=SKTDt1udYpq7oGrGtN/1fTD1rz
 AXHrfS6R92q69GcWmewkd5TuyCtYI0z3rLMSlFYLVO6veoYhBYXLF0ZEA9/KlSzqzg6tZKw902/pS
 2bCrUVZfuiW0ODqxs5XD2SA4p888l0aSZLNucR4/t7ncenM6EZ7YVn7G09/FSqnKX52c=;
Received: from smtp180.sjtu.edu.cn ([202.120.2.180])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqca3-00Ff86-2O
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Jul 2019 12:10:45 +0000
Received: from mta04.sjtu.edu.cn (mta04.sjtu.edu.cn [202.121.179.8])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id 18CFC1008CBC4;
 Thu, 25 Jul 2019 20:10:34 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mta04.sjtu.edu.cn (Postfix) with ESMTP id 046921805CE28;
 Thu, 25 Jul 2019 20:10:34 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from mta04.sjtu.edu.cn ([127.0.0.1])
 by localhost (mta04.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sTTTl-EndM03; Thu, 25 Jul 2019 20:10:33 +0800 (CST)
Received: from mailstore19.sjtu.edu.cn (mailstore19.sjtu.edu.cn
 [202.121.179.19])
 by mta04.sjtu.edu.cn (Postfix) with ESMTP id D72591805CE1D;
 Thu, 25 Jul 2019 20:10:33 +0800 (CST)
Date: Thu, 25 Jul 2019 20:10:33 +0800 (CST)
From: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <919772995.4681005.1564056633580.JavaMail.zimbra@sjtu.edu.cn>
In-Reply-To: <20190725094401.zve4urozmdxtxulx@holly.lan>
References: <20190725053345.5888-1-xywang.sjtu@sjtu.edu.cn>
 <20190725094401.zve4urozmdxtxulx@holly.lan>
MIME-Version: 1.0
X-Originating-IP: [202.120.40.82]
X-Mailer: Zimbra 8.8.9_GA_3798 (ZimbraWebClient - GC73 (Linux)/8.8.9_GA_3744)
Thread-Topic: replace snprintf with strscpy
Thread-Index: FQKQo6UIvdrGowYCpW4mlrIBTsB3GQ==
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [202.120.2.180 listed in list.dnswl.org]
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [202.120.40.82 listed in dnsbl.sorbs.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hqca3-00Ff86-2O
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: replace snprintf with strscpy
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
 jason wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


----- On Jul 25, 2019, at 5:44 PM, Daniel Thompson daniel.thompson@linaro.org wrote:

> On Thu, Jul 25, 2019 at 01:33:45PM +0800, Wang Xiayang wrote:
>> As commit a86028f8e3ee ("staging: most: sound: replace snprintf
>> with strscpy") suggested, using snprintf without a format
>> specifier is potentially risky if the PROMPT environment
>> variable contains any format specifier. The variable can be set
>> via kdb_set() though by default it contains no format specifier.
>> 
>> Using strscpy is conservatively safe for any mistakenly
>> environment variable setting that leads to crash.
> 
> This will result in a broken prompt on SMP machines. The default
> prompt on an SMP machine includes the CPU number of the core that
> is currently being debugged.
> 
> 

Well, this patch only changes the line compiled for UP so it does not
break the prompt on SMP.

Anyway, do you think the patch should be
revised to actually sanitize the format string instead of
conservatively ignoring them?


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
