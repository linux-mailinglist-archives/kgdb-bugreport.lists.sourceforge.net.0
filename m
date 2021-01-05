Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0332EA3DF
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  5 Jan 2021 04:22:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kwcvA-0004WJ-W1
	for lists+kgdb-bugreport@lfdr.de; Tue, 05 Jan 2021 03:22:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bodefang@126.com>) id 1kwcv9-0004WC-RS
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 03:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:References:
 In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qvXrIG+dmnU72ZmzOdFBwSOdXXYsI+f+J3BuDNVRekI=; b=KGTcTRZmScOVssQ2zrrGuLnYxq
 kkVzHq914jb2v1KIefXsYhjLfg07fO6VCiGnz4fW3vMZbSUKbmiw01rYHA6R1xk8tP06jftx95IIg
 +qbQ/xujBK+gFMpJL9qjtTavOIYzKHx0GlO08vlyDOFRcUxTJ6MBXpN0aN6fWvDqnHDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:References:In-Reply-To:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qvXrIG+dmnU72ZmzOdFBwSOdXXYsI+f+J3BuDNVRekI=; b=XdPC5+0ofatWvNTQgtCYQ3vXC1
 vboh5WBfi4TkurzLuGL3gEgkznto8DKPwjjxwewaxQ+7ME1kv8m8eJXEqd0j9PhYM+45PcUBsGmly
 cHn1MuTxqXcY53Ez9sifsoNr8I8VAw2HQK6+w4fi+wWfUp8m1DTPp7A/IzEEaW1sk+QA=;
Received: from m158.mail.126.com ([220.181.15.8])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:DHE-RSA-AES256-SHA:256) (Exim 4.92.2) id 1kwcv2-00EE2D-JE
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Jan 2021 03:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=qvXrI
 G+dmnU72ZmzOdFBwSOdXXYsI+f+J3BuDNVRekI=; b=Z7F0EtExi9yOEkRIHsjqd
 16S2lLLJhCNM+X9PFnOVNdCGz1FdMOlOjw+b/WNSpdW6dO4ZpIMlA5VSXY14Ok0T
 3R4qiC3aI953X7/kSeGPAYqOGEJhqgTGsXM+uBDg/KoBXgjJIFFdLUEEsanG/0CP
 sbvFo05fK1aTE/NNdkUGYc=
Received: from bodefang$126.com ( [36.112.86.8] ) by ajax-webmail-wmsvr8
 (Coremail) ; Tue, 5 Jan 2021 11:21:38 +0800 (CST)
X-Originating-IP: [36.112.86.8]
Date: Tue, 5 Jan 2021 11:21:38 +0800 (CST)
From: bodefang  <bodefang@126.com>
To: "Daniel Thompson" <daniel.thompson@linaro.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20201118(ab4b390f)
 Copyright (c) 2002-2021 www.mailtech.cn 126com
In-Reply-To: <20210104112854.fghr32y37mzw6fpb@holly.lan>
References: <1609120738-202321-1-git-send-email-bodefang@126.com>
 <20210104112854.fghr32y37mzw6fpb@holly.lan>
X-CM-CTRLDATA: 2JbomWZvb3Rlcl9odG09MTk3NDo1Ng==
MIME-Version: 1.0
Message-ID: <279df92c.1b26.176d0907b64.Coremail.bodefang@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: CMqowABXFrpD2_NfQg7zAA--.64063W
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbitQMR11pECyh0wAAAs5
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (bodefang[at]126.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [220.181.15.8 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kwcv2-00EE2D-JE
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: Passing ekgdbts to command
 line causes panic
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
Cc: arnd@arndb.de, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

I use static analysis tool to find these funcs are similar to the commit<1bd54d851f50>(kgdboc: Passing ekgdboc to command line causes panic),
so it's just defensive, I haven't actually hitted this but there actually seems a problem here.







At 2021-01-04 19:28:54, "Daniel Thompson" <daniel.thompson@linaro.org> wrote:
>On Mon, Dec 28, 2020 at 09:58:58AM +0800, Defang Bo wrote:
>> Similar to commit<1bd54d851f50>("kgdboc: Passing ekgdboc to command line causes panic"),
>> kgdbts_option_setup does not check input argument before passing it to strlen.
>> The argument would be a NULL pointer.
>
>Something seems to be missing here.
>
>The ekgdbts parameter mentioned in the subject line doesn't exist so
>how can including it on the kernel command line could provoke a panic.
>
>Please can you share the kernel boot arguments you used when you tested
>this patch?
>
>
>Daniel.
>
>
>> Signed-off-by: Defang Bo <bodefang@126.com>
>> ---
>>  drivers/misc/kgdbts.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
>> index 945701b..b077547 100644
>> --- a/drivers/misc/kgdbts.c
>> +++ b/drivers/misc/kgdbts.c
>> @@ -1057,6 +1057,11 @@ static void kgdbts_run_tests(void)
>>  
>>  static int kgdbts_option_setup(char *opt)
>>  {
>> +	if (!opt) {
>> +		pr_err("kgdbts: config string not provided\n");
>> +		return -EINVAL;
>> +	}
>> +
>>  	if (strlen(opt) >= MAX_CONFIG_LEN) {
>>  		printk(KERN_ERR "kgdbts: config string too long\n");
>>  		return -ENOSPC;
>> -- 
>> 2.7.4
>> 

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
