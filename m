Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF63B2B4115
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 16 Nov 2020 11:28:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kebkn-0005GY-IJ
	for lists+kgdb-bugreport@lfdr.de; Mon, 16 Nov 2020 10:28:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yangtiezhu@loongson.cn>) id 1kebLO-0005FS-UR
 for kgdb-bugreport@lists.sourceforge.net; Mon, 16 Nov 2020 10:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4WFEdRQSXo6qXqcSzlHOMN17BBCsvsvFX/W/yGENY9o=; b=Cwap9TqBsNnu6gA//HrvDO+Ef/
 huwWj5GhBzW9hr/T2uy+7V3Tym/JmZh9pkqN/9B4oftEFQi9V6ArEDeg/RxhuwECE7I3lv3bhQQ4L
 FndVwGFAEYLNReuigtNF2JJs3OnjQb4WOMaDqf81G4ggJXFdOb/xsGy8yZmRgnzOsYoI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4WFEdRQSXo6qXqcSzlHOMN17BBCsvsvFX/W/yGENY9o=; b=gfMXOz8yOLPqMwe2FSoulwEOcV
 60PQaVhkncGILzOVwWjBuer3thJxpUPMq2mf9XV1PsnTdRwH8LcKyxwoCpNCkHPaX5wYUx3zIP2S+
 VLYP9yhmuI+7XeHanNzmdKZ6TTCBNUg4bz49QJSsUofJuY7RcK93N+BgfAPycr292zrA=;
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1kebL8-00EUNJ-59
 for kgdb-bugreport@lists.sourceforge.net; Mon, 16 Nov 2020 10:02:42 +0000
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv9OYSbJfoOEPAA--.33384S2; 
 Mon, 16 Nov 2020 17:42:48 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Corbet <corbet@lwn.net>
Date: Mon, 16 Nov 2020 17:42:47 +0800
Message-Id: <1605519767-25502-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxv9OYSbJfoOEPAA--.33384S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW7Zr4kur1fuFWDuFy5XFb_yoW8GrW5pr
 s8C3saq3yDJw15K3y8Kr1UC343AFZ3X3yUCrZ2gF45XF15XwnYqry3K3WkZ3WDJF4IyFWj
 vr9IgFyqk3Wqy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4f
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0xhLUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kebL8-00EUNJ-59
X-Mailman-Approved-At: Mon, 16 Nov 2020 10:28:56 +0000
Subject: [Kgdb-bugreport] [PATCH] Documentation: kgdb: Fix a typo
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
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

"to into" -> "into"

Reported-by: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Documentation/dev-tools/kgdb.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
index 77b688e..4345624 100644
--- a/Documentation/dev-tools/kgdb.rst
+++ b/Documentation/dev-tools/kgdb.rst
@@ -63,10 +63,9 @@ will want to turn on ``CONFIG_DEBUG_INFO`` which is called
 It is advised, but not required, that you turn on the
 ``CONFIG_FRAME_POINTER`` kernel option which is called :menuselection:`Compile
 the kernel with frame pointers` in the config menu. This option inserts code
-to into the compiled executable which saves the frame information in
-registers or on the stack at different points which allows a debugger
-such as gdb to more accurately construct stack back traces while
-debugging the kernel.
+into the compiled executable which saves the frame information in registers
+or on the stack at different points which allows a debugger such as gdb to
+more accurately construct stack back traces while debugging the kernel.
 
 If the architecture that you are using supports the kernel option
 ``CONFIG_STRICT_KERNEL_RWX``, you should consider turning it off. This
-- 
2.1.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
